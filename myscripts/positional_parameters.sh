#!/bin/bash

#### ${0} prints the first argument of the script i.e script full path itself

echo "The first argument of the script is : ${0}"

file_name=$(basename "${0}")
dir_name=$(dirname "${0}")
echo "The path of ${file_name} is ${dir_name}"

#### ${#} returns the number of arguments passed while executing the script

if [ "${#}" -lt 1 ]
then
    echo "Please enter atleat on name"
    exit 1
fi

#### ${@} - it will capture all arguments starting from ${1} and make it as a list

for i in "${@}"
do
    echo "Name is : ${i}"
done