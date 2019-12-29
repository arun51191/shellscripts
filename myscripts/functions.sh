#!/bin/bash
myfun()
{
    message="${@}"
    if [[ "${verbose}" = 'true' ]]
    then
        echo "${message}"
    fi
}

verbose='false'
myfun "Hello function"

readonly verbose='true'
myfun 'Hello function'