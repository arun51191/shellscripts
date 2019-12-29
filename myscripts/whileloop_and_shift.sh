#!/bin/bash
while [ "${#}" -gt 0 ]   ## run the loop until the number of arguments is greater than zero
do
    echo "Number of arguments: ${#}"
    for i in ${@}    ## run the loop to print all the elements in the list
    do 
        echo "Name : ${i}"
    done
    echo ""  ## printing an empty line
    shift   ## it will remove the first argument every time
done