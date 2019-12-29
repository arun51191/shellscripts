#!/bin/bash

while getopts l:vs OPTION
do
    case "${OPTION}" in

    l)
        length="${OPTARG}"
        echo "Lengh of password ${length}"
        ;;
    v)
        verbose='true'
        echo "Verbose is enabled"
        ;;
    s)
        special_char='true'
        echo "Special character is added to password"
        ;;
    ?)
        echo "Invalid option given"
    esac
done

echo "Option Index is : ${OPTIND}"

echo "Number of arguments passed with the script ${#}"

shift "$(( OPTIND - 1 ))"

if [[ "${#}" -gt 0 ]]
then
    echo "Invalid number of arguments given" >&2
fi

