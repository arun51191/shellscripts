#!/bin/bash

### This scripts try to ping the remote server for every 5 seconds and sends the response
read -p "Enter the remote hostname:" remote
while ping -c 1 "${remote}" >/dev/null
do
    echo "Machine is up and running...."
    sleep 5
done

echo "Machine ${remote} is down..exiting from the script"