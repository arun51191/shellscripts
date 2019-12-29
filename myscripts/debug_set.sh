#!/bin/bash
read -p "Enter the filename: " filename
set -x
if [[ -d "$filename" ]]
then
    echo "${filenmae} exists and is a directory"
elif [[ -e "$filename" ]]
then
    echo "${filename} exists and is a file"
else
    echo "file or directory with the name ${filename} doesn't exist"
    exit 0
fi
if [[ -r "$filename" ]]
then
    echo "${filenmae} can be read by user: ${UID}"
    if [[ -w "$filename" ]]
    then
        echo "${filename} can be written by user: ${UID}"
    else
        echo "${filename} can't be wirtten by user: ${UID}"
    fi
else
    echo "${filename} can't be read by user: ${UID}"
fi
set +x
exit 0