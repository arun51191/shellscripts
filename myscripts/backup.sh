#!/bin/bash
backup()
{
    file="${1}"
    if [[ -f "${file}"  ]]
    then
        base_name=$(basename "${file}")
        logger -t backup "Copying ${base_name} to /var/tmp/${base_name}"
        cp -p "${file}" /var/tmp/"${base_name}"
        if [[ "${?}" = 0 ]]
        then
            logger -t backup "Backup to /var/tmp/${base_name} completed"
        else 
            logger -t backup "Backup failed to /var/tmp/${base_name}"
        fi
    else
        logger -t backup "${file} doesn't exist"
    fi
}

backup "${1}"
