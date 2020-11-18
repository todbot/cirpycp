# cirpycp

Copy files from CircuitPython Bundle to your CircuitPython device.

This script tries to make it easier to copy files from the
[CircuitPython Bundle](https://circuitpython.org/libraries)
to your CircuitPython device.

Usage:
```
./cirpycp.sh adafruit-circuitpython-bundle-6.x-mpy-20201117 myreqs.txt /Volumes/CIRCUITPY

```

Notes:
- The third (last) argument defaults to `/Volumes/CIRCUITPY` so you don't need to specify that if on MacOS.
- The second argument defaults to `reqs.txt` in the curretn directory, so it also may be omitted if you're in the directory containing `reqs.txt`
- The first argument is the location of the unzipped CircuitPython bundle
- "cirpycp" is pronounce as "joe PIS-cə-poh"


---
2020 @todbot & @johnedgarpark


