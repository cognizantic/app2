import pefile
import psutil
import time
from datetime import datetime
from collections import defaultdict
from dataclasses import dataclass, field
from typing import Optional, Set, Dict


# --------- STEP 1: Parse static dependencies ---------
def get_static_imports(exe_path):
    pe = pefile.PE(exe_path)
    imports = []
    if hasattr(pe, 'DIRECTORY_ENTRY_IMPORT'):
        for entry in pe.DIRECTORY_ENTRY_IMPORT:
            imports.append(entry.dll.decode('utf-8', errors='ignore'))
    return imports


@dataclass
class ProcState:
    open_files: Set[str] = field(default_factory=set)
    last_event_file: Optional[str] = None  # what we'll print in "Previous File"


# --------- STEP 2: Snapshot a single process and emit events ---------
def snapshot_process(proc: psutil.Process, seen_counts: defaultdict, state: ProcState) -> ProcState:
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
def monitor_by_name(process_name: str, interval: float = 10.0):
    seen_counts = defaultdict(int)                 # counts per file path (for OPEN events)
    proc_states: Dict[int, ProcState] = {}         # PID -> ProcState

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

                state = proc_states.get(pid, ProcState())
                state = snapshot_process(proc, seen_counts, state)
                proc_states[pid] = state

        # Drop states for processes that disappeared
        dead_pids = set(proc_states.keys()) - seen_pids_this_loop
        for pid in dead_pids:
            del proc_states[pid]

        if not found_any:
            print(f"[{datetime.now()}] No process named {process_name!r} found. Waiting...")
            proc_states.clear()  # reset per-PID previous/opens when nothing is running

        time.sleep(interval)


# --------- STEP 4: Run example ---------
if __name__ == "__main__":
    exe_path = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
    process_name = "chrome.exe"

    # Static imports (DLLs)
    try:
        static_imports = get_static_imports(exe_path)
        for dll in static_imports:
            print(f"{'STATIC':<10} {1:<6} {'-':<7} {'-':<50} {dll}")
    except FileNotFoundError:
        print(f"[WARN] Executable not found at: {exe_path}")
    except Exception as e:
        print(f"[WARN] Failed to parse static imports: {e}")

    print(f"\nMonitoring processes named '{process_name}'...\n")
    try:
        monitor_by_name(process_name, interval=10.0)
    except KeyboardInterrupt:
        print("Stopped monitoring.")
