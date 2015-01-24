#!/bin/bash
# source1: $1 source2: $2 source2 $3 dest
usage ()
{
    echo -n "usage: cpdirs.sh souruce_directory1"
    echo " source_directory2 dest_directory"
    exit
}

if [ $# -ne 3 ] ; then
	usage
fi

for i in {$1,$2} ; do
    if [ ! -d "$i" ] ; then
        usage
    fi
done

condition=1

for i in $(ls) ; do
	if [ "$i" == "$3" ]; then
        if [ -f "$i" ] ; then
            usage
        fi
		condition=2
	fi
done

if [ $condition -eq 1 ] ; then
	mkdir $3
fi

for i in $( find $1 -type f ); do
	cp -f "$i" "$3"
done

for i in $(find $2 -type f); do
	for j in $(ls "$3" ) ; do
		if [ "$i" == "$j" ] && [ "$i" -ot "$j"  ]; then
			cp -f "$j" "$3"
		else
            cp -f "$j" "$3"
        fi
	done
done 
