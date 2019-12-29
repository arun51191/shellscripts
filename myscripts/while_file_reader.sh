#!/bin/bash

#### This script reads the file line by line and print them with line number

read -p "Enter file name:" FILE_NAME
echo ""
if [[ ! -f "$FILE_NAME" ]]
then
    echo "${FILE_NAME} can't be opened"
    exit 1
fi
LINE_NUMBER=1
while read  LINE 
do
    echo "${LINE_NUMBER}: ${LINE}"
    (( LINE_NUMBER++ ))
    echo ""
done < "$FILE_NAME"