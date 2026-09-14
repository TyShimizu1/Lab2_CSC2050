#!/usr/bin/env bash


if [[ -z "$1" ]]; then 
	echo "error, only 1 argument allowed"
      	echo "Usage: $0 <filename.c"> 
	exit 1 
fi 

filename=$1 

Owner=$(ls -l | awk '{print $3}') 

last_modified=$(ls -l $filename | awk '{print $6 " " $7, " " $8 " "}') 

if [[ "$1" != *.c ]]; then
        echo "Not a .c file"
        exit 1
fi

touch temp.txt 
cat $filename > temp.txt 

if [[ "$1" != *.c ]]; then
        echo "Not a .c file"        exit 1
fi

echo "/** 
* File Name: $filename 
*Owner: $Owner 
*last_modified:$last_modified 
*." > "$filename" 

cat temp.txt >> $filename 
rm temp.txt 


#!/usr/bin/env bash


if [[ -z "$1" ]]; then
        echo "error, only 1 argument allowed"
        echo "Usage: $0 <filename.c">&2
        exit 1
fi

filename=$1

Owner=$(ls -l "$filename" | awk '{print $3}')

last_modified=$(ls -l "$filename" | awk '{print $7, $8, $9}')

if [[ "$1" != *.c ]]; then
        echo "Not a .c file"
        exit 1
fi

touch temp.txt
cat $filename > temp.txt

if [[ "$1" != *.c ]]; then
        echo "Not a .c file"        
	exit 1
fi

echo "/**
* File Name: $filename
*Owner: $Owner
*last_modified:$last_modified
*." > "$filename"
