import pefile
import psutil
import time
from datetime import datetime
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Optional, Set, Dict

class fileMonitor:
    class fileTable1:
        def __init__(self, **kwargs):
            self.callType = kwargs.get("callType")
            self.fileFormat = kwargs.get("fileFormat")
            self.count = kwargs.get("count", 1)
            self.previousFile = kwargs.get("previousFile")
            self.previousPath = kwargs.get("previousPath")
            self.currentFile = kwargs.get("currentFile")
            self.currentPath = kwargs.get("currentPath")
        def incCount(self):
            self.count+=1
        

    
    def __init__(self,processPath):
        self.processTable=[]
        if processPath is not None:
            self.processPath=processPath
            processName=processPath.split("\\")
            self.processName=processName[len(processName)-1]
        else:
            print("process not specified")

    def checkFileTable1(self, callType, previousFile, currentFile):
        for obj in self.processTable:
            if obj.previousFile == previousFile and obj.currentFile == currentFile:
                if obj.callType == callType:
                    obj.incCount()   
                    return False     
                break
        return True

            

    def addProcess(self,imports,callType):
        previousFile=None
        for i in range(len(imports)):
            if(self.checkFileTable1(callType=callType,previousFile=previousFile,currentFile=imports[i])):
                fileFormat=imports[i].split(".")
                self.processTable.append(self.fileTable1(callType=callType,currentFile=imports[i],fileFormat=fileFormat[len(fileFormat)-1]))
        return None


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
        last_event_file: Optional[str] = None  # what we'll print in "Previous File"

    @staticmethod
    def snapshot_process(proc: psutil.Process, seen_counts: defaultdict, state: "fileMonitor.ProcState"):
        try:
        # Collect open files
            paths = set()

        # Regular open file handles
            try:
                for f in proc.open_files():
                    if f.path:
                        paths.add(f.path)
            except (psutil.AccessDenied, psutil.ZombieProcess):
                pass

        # Memory-mapped files / DLLs (may require admin; handle gracefully)
            try:
                for m in proc.memory_maps():
                    if getattr(m, "path", None):
                        paths.add(m.path)
            except (psutil.AccessDenied, psutil.ZombieProcess):
                pass

            open_now = paths

        # Compute deltas
            new_files = open_now - state.open_files
            closed_files = state.open_files - open_now

        # Sort for deterministic output
            for f in sorted(new_files):
                seen_counts[f] += 1
                prev = state.last_event_file or "-"
                print(f"{'OPEN':<10} {seen_counts[f]:<6} {proc.pid:<7} {prev:<50} {f}")
                state.last_event_file = f

            for f in sorted(closed_files):
                prev = state.last_event_file or "-"
                print(f"{'CLOSE':<10} {'-':<6} {proc.pid:<7} {prev:<50} {f}")
                state.last_event_file = f

            state.open_files = open_now
            return state

        except (psutil.NoSuchProcess, psutil.ZombieProcess):
        # Process ended — no change to state needed here (caller may discard it)
            return state


# --------- STEP 3: Continuously monitor by name ---------
    def monitor_by_name(self,process_name: str, interval: float = 10.0):
        seen_counts = defaultdict(int)                 # counts per file path (for OPEN events)
        proc_states: Dict[int, self.ProcState] = {}         # PID -> ProcState

        print(f"{'Event':<10} {'Count':<6} {'PID':<7} {'Previous File':<50} {'Current File'}")
        print("-" * 140)

        while True:
            found_any = False
            seen_pids_this_loop = set()

            for proc in psutil.process_iter(['pid', 'name']):
                name = (proc.info.get('name') or '').lower()
                if process_name.lower() in name:
                    found_any = True
                    pid = proc.info['pid']
                    seen_pids_this_loop.add(pid)

                    state = proc_states.get(pid, self.ProcState())
                    state = self.snapshot_process(proc, seen_counts, state)
                    proc_states[pid] = state

        # Drop states for processes that disappeared
            dead_pids = set(proc_states.keys()) - seen_pids_this_loop
            for pid in dead_pids:
                del proc_states[pid]

            if not found_any:
                print(f"[{datetime.now()}] No process named {process_name!r} found. Waiting...")
                proc_states.clear()  # reset per-PID previous/opens when nothing is running

            time.sleep(interval)


    def printTable(self):
        print("Process ID | Call Type | File Format | Count | Previous File | Current File | Previous Path | Current Path",flush=True)
        print("__________________________________________________________________________________________________________",flush=True)
        myProcessID=0
        for obj in self.processTable:
            myProcessID+=1
            print(myProcessID,obj.callType,obj.fileFormat,obj.count,obj.previousFile,obj.currentFile,obj.previousPath,obj.currentPath,sep=" | ",flush=True)
        print(f"\033[{len(self.processTable)+2}A", end="",flush=True)

    def startMonitor(self):
        try:
            self.addProcess(imports=self.getStaticImports(),callType="static")
            while True:
                self.printTable()

        except KeyboardInterrupt:
            print("\n")
            print("process stopped")
            print("\n")


chrome=fileMonitor(r"C:\Program Files\Google\Chrome\Application\chrome.exe")
chrome.startMonitor()
