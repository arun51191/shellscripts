#!/bin/bash
trap "echo interruption from the keyboard.. removing temporary files...;rm -rf /tmp/trap/*;ls -ltr /tmp/trap/;exit 0" 0 2 15 
echo "PID: $$"
count=0
echo "Creating files in /tmp/trap"
mkdir -p /tmp/trap
while (( count<10 ))
do
    sleep 5
    echo "$count"
    (( count++ ))
    touch "/tmp/trap/file-${count}"
    ls -ltr /tmp/trap/
done