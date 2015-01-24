#!/bin/bash
 

if [ $# -lt 1 ]; then
	echo "usage: uncomp.sh {filelist}+"
	exit
fi


for i in "$@" ; do
	case $i in
		*.tar) tar -xf $i ;;
		*.tar.gz) tar -xzf $i ;;
		*.tgz)  tar -xzf $i;;
		*.tar.Z) uncompress $i ;;
		*.gz) gunzip $i ;;
		*.Z) uncompress $i;;
		*.zip) unzip -o $i;;
		*) echo "uncomp.sh $i has no compression extension";;
	esac 
done
