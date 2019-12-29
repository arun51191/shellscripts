#!/bin/bash
while true 
do
    echo ""
    read -p "Enter your name:" name 
    echo "Confirming your username: ${name}"
    read -p "Is it correct?(y/n)" response
    if [[ "$response" = "y" || "$response" = "yes" ]]
    then
        echo "Response is given as ${response}"
        echo "${name} is given as name"
        echo "Exiting the script..."
        break;
    fi
    echo "Response is given as ${response}"
done

    