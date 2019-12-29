#!/bin/bash

print_verbose()
{
    if [[ "${verbose}" = 'true' ]]
    then
        echo "${@}"
    fi
}

print_usage()
{
    echo "-l LENGTH  for length of the password"
    echo "-s         for special character"
    echo "-v         for verbose"
    exit 1
}

password_generator() 
{
    print_verbose "verbose will be shown"

    print_verbose "Generating random password"

    print_verbose "Password length will be ${length}"

    password=$(date +%S%N${RANDOM}${RANDOM}|sha256sum|head -c${length}) 

    if [[ "${special_char}" = 'true' ]]
    then

        special=$(echo "!@#$%%^&*"|fold -w2|shuf|head -n1)

        print_verbose "Adding special character"

        password="${password}${special}"

    fi

    echo "Password is: ${password}"
}

length=10

while getopts vsl: OPTION
do
    case "${OPTION}" in

    s)
            
            special_char='true'
            ;;

    v)
            
            verbose='true'
            ;;
            
    l)    
            length="${OPTARG}"
            ;;

    ?)
            echo "Invlid option" >&2
            print_usage
            exit 1
            ;;

    esac

done

password_generator



