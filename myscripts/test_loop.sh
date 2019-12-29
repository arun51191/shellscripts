#!/bin/bash
for filename in "${@}"
do
    if [[ -d "$filename" ]]
    then
        echo "${filenmae} exists and is a directory"
    elif [[ -e "$filename" ]]
    then
        echo "${filename} exists and is a file"
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
    else
        echo "file or directory with the name ${filename} doesn't exist"
    fi    
    echo ""
    echo ""
done
exit 0