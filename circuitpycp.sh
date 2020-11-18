#!/usr/bin/env bash
#
# circuitpycp.sh -- copy required files from adafruit-circuitpython-bundle
#                   to CIRCUITPY disk
#
# 2020 - @todbot & @johnedgarpark
#

bundlepath_default=${HOME}/projects/circuitpython/adafruit-circuitpython-bundle-6.x-mpy-20201117
reqs_default=reqs.txt
destdir_default=/Volumes/CIRCUITPY

cpcmd='cp -RX'

# or pass in 1st argument = source path, 2nd arg = requirements file, 3rd = dest
bundlepath=${1:-$bundlepath_default}
reqfile=${2:-$reqs_default}
destdir=${3:-$destdir_default}

if [ ! -f "$reqfile" ]; then
    echo "You need to specify a 'reqs.txt' file"
    exit 1
fi

echo "bundlepath:${bundlepath}"
echo "reqsfile:${reqfile}"
echo "destdir:${destdir}"

echo "copying files to $destdir..."
while read f; do
    if [[ $f == "#"* ]];  # if line is a comment
    then  
        echo "$f"
    else
        echo ".. ${cpcmd} \"${bundlepath}/lib/${f}\" \"${destdir}/lib\""
                 ${cpcmd} \"${bundlepath}/lib/${f}\" \"${destdir}/lib\"
    fi
done <$reqfile




