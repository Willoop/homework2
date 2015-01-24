#!/bin/bash

# $1: directory $2: pattern $3 grep option

if [ $# -lt 2 ] ; then
        echo "usage: gredir.sh directory pattern [-grep option]*"
        exit
fi

if [ ! -d "$1" ] ; then
	echo "usage: gredir.sh directory pattern [-grep option]*"
	exit
fi

directory=$1
pattern=$2
shift
shift

for i in $@ ; do
    if [ ! ${i:0:1} = "-" ] ; then
        echo "usage: gredir.sh directory pattern [-grep option]*"
        exit
    fi
    flag+="$i "
done

for line in $(find "$directory") ; do
	if [ -f "$line" ] ; then
		grep $flag "$pattern" "$line"
	fi
done







