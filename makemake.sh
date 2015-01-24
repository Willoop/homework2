#!/bin/bash

if [ $# -lt 1 ]; then
echo "Executable name required."
echo "usage: makemake.sh executable_name"
exit
fi

obejects=""
echo -n "$1 :" > Makefile
name=$1
shift
constant="g++ -ansi -Wall -g -c"
argu=""
head=""

for i in $@ ; do
    argu="$argu $i"
done

for i in $(ls *.cpp) ; do
    objects="$objects ${i%%.*}"
done

for i in $objects ; do
    echo -n " $i.o" >> Makefile
done

echo >> Makefile
echo -n -e "\tg++ -ansi -Wall -g -o $name $argu " >> Makefile

for i in $objects ; do
   echo -n "$i.o " >> Makefile
done

echo >> Makefile
echo >> Makefile

for i in $objects ; do
    echo -n "$i.o :" >> Makefile
    echo -n " $i.cpp " >> Makefile
    echo -n $(grep "^#include \".*\.h\"" "$i.cpp" | awk '{print $2}' | sed 's/"/ /g') >> Makefile
    echo >> Makefile
    echo -e "\t$constant $argu $i.cpp" >> Makefile
    echo >> Makefile
done

echo "clean :" >> Makefile
echo -n -e "\trm -f $name" >> Makefile

for i in $objects ; do
    echo -n " $i.o" >> Makefile
done