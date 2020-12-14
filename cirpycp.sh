#!/usr/bin/env bash
#
# cirpycp.sh -- copy required files from adafruit-circuitpython-bundle
#               to CIRCUITPY disk
#
# 2020 - @todbot & @johnedgarpark
#

if [ "$#" -eq 0 ] ; then
    echo "usage: cirpycp [bundle_path] [reqs.txt] [dest_dir]"
    exit 1
fi

bundlepath_default='' 
reqs_default=reqs.txt
destdir_default=/Volumes/CIRCUITPY

cpcmd='cp -R'             # unix-like default
UNAME=$(uname -s)
if [ $UNAME == "Darwin" ]; then
   cpcmd='cp -RX'         # macos case
fi

# or pass in 1st argument = source path, 2nd arg = requirements file, 3rd = dest
bundlepath=${1:-$bundlepath_default}
reqfile=${2:-$reqs_default}
destdir=${3:-$destdir_default}

if [ ! -d "$bundlepath" ]; then
    echo "You need to specify a CircuitPython bundle dir";  exit 1
fi
if [ ! -f "$reqfile" ]; then
    echo "You need to specify a 'reqs.txt' file"; exit 1
fi
if [ ! -d "$destdir" ] || [ ! -d "$destdir/lib" ]; then
    echo "Destdir '$destdir/lib' not found"; exit 1
fi
if [[ $destdir == *"lib" ]]; then
    echo "Destdir '$destdir' contains 'lib', please remove it"; exit 1
fi

echo "bundlepath: ${bundlepath}"
echo "reqsfile: ${reqfile}"
echo "destdir: ${destdir}"

echo "copying files to $destdir/lib..."
while read f; do
    echo "$f"
    if [[ -z "$f" ]]; then  # if line is blank
       continue
    fi
    if [[ $f == "#"* ]];  # if line is a comment
    then
        echo "--"
    else
#        echo ".. ${cpcmd} \"${bundlepath}/lib/${f}\" \"${destdir}/lib\""
                 ${cpcmd} "${bundlepath}/lib/${f}" "${destdir}/lib"
    fi
done <$reqfile

echo



