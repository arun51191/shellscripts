#!/bin/bash
SERVER_LIST="/home/ec2-user/server_list"
SSH_OPTIONS="-o ConnectTimeout=2"

usage() {

    echo "This script is for executing the commands on remote hosts"
    echo "${0} [OPTIONS] [COMMAND1,COMMAND2,...] (atleast one command is mandatory)"
    echo "-f FILE  to specify the file contains remote servers list, default file will be taken if this option not provided"
    echo "-n       to run dry run instead of executing the commands on remote hosts"
    echo "-s       to run the commands with SUDO access on remote hosts"

}

### exit from the script if it is run with SUDO 

if [[ "${UID}" -eq 0 ]]
then
    echo "script should be executed with non sudo user" >&2
    exit 1
fi

### verifying the options passed while executing the script

while getopts f:ns OPTION
do
    case ${OPTION} in
        
    n) 
        DRY_RUN="true"
        ;;
    s)
        SUDO="sudo"
        ;;
    f)
        SERVER_LIST=${OPTARG}
        ;;
    ?)
        usage
        ;;
    esac
done

### verify that at least one command is provided after the options

shift "$(( OPTIND - 1 ))"   

if [[ "${#}" -lt 1 ]]
then
    echo "At least one command should be given to execute on remote hosts" >&2
    exit 1
fi

### verifying the server file exist or not

if [[ ! -e "${SERVER_LIST}" ]]
then
    echo "Can't open the file: ${SERVER_LIST}" >&2
    exit 1
else
    EXIT_STATUS=0
    for SERVER in $(cat ${SERVER_LIST})
    do
        if [[ "${DRY_RUN}" = "true" ]]
        then
            echo "Performing dry run on ${SERVER}"
            for COMMAND in "${@}"
            do
                echo "${SUDO} ${COMMAND}"
            done
        else
            echo "Executing commands on the ${SERVER}"
            for COMMAND in "${@}"
            do 
                ssh "${SSH_OPTIONS}" "${SERVER}" "${SUDO}" "${COMMAND}"
                EXIT_STATUS="${?}"
                if [[ "${EXIT_STATUS}" != 0 ]]
                then
                    echo "Command ${COMMAND} failed to execute on ${SERVER}">&2
                fi
            done
        fi
    done
fi
exit "${EXIT_STATUS}"