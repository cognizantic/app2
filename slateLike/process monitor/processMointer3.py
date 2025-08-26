import pefile
import psutil
import time
from datetime import datetime
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Optional, Set, Dict, List, Tuple

class fileMonitor:
    class fileTable1:
        def __init__(self, **kwargs):
            self.callType = kwargs.get("callType")
            self.fileFormat = kwargs.get("fileFormat")
            self.count = kwargs.get("count", 1)
            self.previousFile = kwargs.get("previousFile") 
            self.currentFile = kwargs.get("currentFile")
        def incCount(self):
            self.count += 1

    def __init__(self, processPath):
        self.processTable = []
        self.seen_counts = defaultdict(int)
        self.proc_states: Dict[int, fileMonitor.ProcState] = {}
        if processPath is not None:
            self.processPath = processPath
            processName = processPath.split("\\")
            self.processName = processName[-1]
        else:
            print("process not specified")

    def checkFileTable1(self, callType, previousFile, currentFile):
        for obj in self.processTable:
            if obj.callType == callType and obj.previousFile == previousFile and obj.currentFile == currentFile:
                obj.incCount()
                return False
        return True

    def addProcess(self, imports, callType, previousFileOverride=None):
        previousFile = None
        for i in range(len(imports)):
            pf = previousFileOverride if previousFileOverride is not None else previousFile
            if self.checkFileTable1(callType=callType, previousFile=pf, currentFile=imports[i]):
                parts = imports[i].rsplit(".", 1)
                fileFormat = parts[-1] if len(parts) == 2 else "-"
                self.processTable.append(
                    self.fileTable1(
                        callType=callType,
                        currentFile=imports[i],
                        fileFormat=fileFormat,
                        previousFile=pf
                    )
                )
            previousFile = imports[i]

    def getStaticImports(self):
        pe = pefile.PE(self.processPath)
        imports = []
        if hasattr(pe, 'DIRECTORY_ENTRY_IMPORT'):
            for entry in pe.DIRECTORY_ENTRY_IMPORT:
                imports.append(entry.dll.decode('utf-8'))
        return imports

    @dataclass
    class ProcState:
        open_files: Set[str] = field(default_factory=set)
        last_event_file: Optional[str] = None

    @staticmethod
    def snapshot_process(proc: psutil.Process, seen_counts: defaultdict, state: "fileMonitor.ProcState") -> Tuple["fileMonitor.ProcState", List[Tuple[Optional[str], str]]]:
        try:
            paths = set()
            try:
                for f in proc.open_files():
                    if f.path:
                        paths.add(f.path)
            except (psutil.AccessDenied, psutil.ZombieProcess):
                pass
            try:
                for m in proc.memory_maps():
                    if getattr(m, "path", None):
                        paths.add(m.path)
            except (psutil.AccessDenied, psutil.ZombieProcess):
                pass
            open_now = paths
            new_files = open_now - state.open_files
            events: List[Tuple[Optional[str], str]] = []
            for f in sorted(new_files):
                seen_counts[f] += 1
                events.append((state.last_event_file, f))
                state.last_event_file = f
            state.open_files = open_now
            return state, events
        except (psutil.NoSuchProcess, psutil.ZombieProcess):
            return state, []

    def monitor_dynamic(self, process_name: str, interval):
        seen_pids_this_loop = set()
        for proc in psutil.process_iter(['pid', 'name']):
            name = (proc.info.get('name') or '').lower()
            if process_name.lower() in name:
                pid = proc.info['pid']
                seen_pids_this_loop.add(pid)
                state = self.proc_states.get(pid, self.ProcState())
                state, open_events = self.snapshot_process(proc, self.seen_counts, state)
                self.proc_states[pid] = state
                for prev, curr in open_events:
                    self.addProcess([curr], callType="dynamic", previousFileOverride=prev)
        dead_pids = set(self.proc_states.keys()) - seen_pids_this_loop
        for pid in dead_pids:
            del self.proc_states[pid]
        time.sleep(interval)

    def printTable(self):
        header = "Process ID | Call Type | File Format | Count | Previous File | Current File"
        sep = "_" * 120
        lines = [header, sep]
        myProcessID = 0
        for obj in self.processTable:
            myProcessID += 1
            line = f"{myProcessID} | {obj.callType} | {obj.fileFormat} | {obj.count} | {obj.previousFile} | {obj.currentFile}"
            lines.append(line)
        table_str = "\n".join(lines)
        print(table_str, flush=True)
        with open("table.txt", "w", encoding="utf-8") as f:
            f.write(table_str)

    def startMonitor(self,interval):
        try:
            self.addProcess(imports=self.getStaticImports(), callType="static")
            while True:
                self.monitor_dynamic(self.processName, interval=interval)
                self.printTable()
        except KeyboardInterrupt:
            print("\nprocess stopped\n")

chrome = fileMonitor(r"C:\Program Files\Google\Chrome\Application\chrome.exe")
chrome.startMonitor(interval=1.0)
