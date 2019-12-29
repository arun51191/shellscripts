#!/bin/bash

echo "UID of the current user is $UID"
if [ "$UID" -eq 0 ]
then
    echo "He is the root user...exiting from script"
    exit 1
else
    echo "He is the non root user"
fi

uname=$(id -un)

if [ "${?}" -eq 0 ]
then
    echo "User name is $uname"
else
    echo "Command to get the current username is wrong"
    exit 1
exit 0
fi
