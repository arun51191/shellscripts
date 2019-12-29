#!/bin/bash
echo 'Hello'
word='Script'
echo 'This is shell $word'
echo "This is shell $word"

echo "$wording is fun"
echo "${word}ing is fun"


echo "The UID of the current user is $UID"

user_name=$(id -un)

echo "The user name of the current user is $user_name"

if [[ "$UID" -eq 0 ]]
then
echo "Current user is root"
else
echo "Current user is not a root user"
fi