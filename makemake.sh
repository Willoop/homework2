#!/bin/bash

if [ $# -lt 1 ]; then
echo "Executable name required."
echo "usage: makemake.sh executable_name"
exit
fi

argu=""
obejects=""

echo $1 >> Makefile

shift

for i in $@ ; do
    argu="$argu $i"
done

for i in $(ls *.cpp) ; do

done
