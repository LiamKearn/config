import atexit
import os
import readline
from pathlib import Path
from functools import partial

MAX_HIST_LEN = 10000

print()

cache_home = Path(os.getenv('XDG_CACHE_HOME', default=Path.home() / '.cache'))
histfile = cache_home / 'python_history'

if not os.path.exists(histfile):
    exit(f'[init.py] Exiting: {histfile} does not exist.')

readline.read_history_file(histfile)
readline.set_history_length(MAX_HIST_LEN)
atexit.register(readline.write_history_file, histfile)

truthy = partial(filter, None)

print(f'[init.py] Utilising {histfile} for history.')
