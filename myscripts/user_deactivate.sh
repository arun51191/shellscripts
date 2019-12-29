#!/bin/bash
usage(){
    echo "user_deactivate [OPTIONS] [USER1,USER2,....]"
    echo "WITHOUT options, user accounts will be locked"
    echo "-d DELETE the user permanently"
    echo "-r REMOVE the home directory"
    echo "-a ARCHIVE the home directory"
    echo "-h help"
    exit 1
}

### checking the script is being exectued with sudo/root user or not

if [[ "${UID}" -ne 0 ]]
then 
    echo "script should be executed by sudo or root user only..." >&2
    exit 1
fi

### checking the options are valid or not
while getopts drah OPTION
do
    case ${OPTION} in
        d) DELETE_USER="true"
        ;;
        a) ARCHIVE_DIR="true"
        ;;
        r) REMOVE_HOME="true" 
        ;;
        h) usage
        ;;
        ?) usage
        ;;
    esac
done

### pass the control to the user list in command line arguments by removing removing options
shift "$(( OPTIND - 1 ))"

### check atleast one user is given as command line arguments
if [[ "${#}" -lt 1 ]]
then
    echo "Please enter atleast one username to disable/delete" >&2
    exit 1
fi

### performing the operations for user accounts

for user in "${@}"
do
    uid=$(id -u ${user})
    if [[ "${?}" -ne 0 ]]
    then 
        exit 1
    fi

    if [[ "${uid}" -le 1000 ]]
    then
        echo "Can't delete the service accounts" >&2
        exit 1
    fi

    if [[ "${DELETE_USER}" = 'true' ]]
    then
        echo "Deleting the user ${DELETE_USER}  permanently"
        userdel "${user}"
        if [[ "${?}" -ne 0 ]]
        then
            echo "User ${user} couldn't be deleted" >&2
            exit 1
        fi
        echo "User ${user} successfully deleted"

    else 
        echo "Deactivating the user temporarly"
        chage -E 0 "${user}"
        if [[ "${?}" -ne 0 ]]
        then
            echo "User couldn't be locked" >&2
            exit 1
        fi
        echo "User successfully locked"
    fi

    if [[ "${ARCHIVE_DIR}" = 'true' ]]
    then
        if [[ "${DELETE_USER}" != 'true' ]]
        then
            echo "can't archive the home directory directory if delete user option is not choosen" >&2
            exit 1
        fi
        echo "Archiving /home/${user} to /archived_homes/${user}.tgz"
        mkdir -p /archived_homes
        tar -cvzf /archived_homes/"${user}.gz" /home/"${user}" 2>/dev/null
        if [[ "${?}" -ne 0 ]]
        then
            echo "home directory /home/${user} couldn't be arcived" >&2
            exit 1
        fi
        echo "Home directory /home/${user} is archived"
    fi

    if [[ "${REMOVE_HOME}" = 'true' ]]
    then
        if [[ "${DELETE_USER}" != 'true' ]]
        then
            echo "can't remove the home directory directory if delete user option is not choosen" >&2
            exit 1
        fi
        echo "Removing /home/${user}"
        rm -rf /home/"${user}"
        if [[ "${?}" -ne 0 ]]
        then
            echo "home directory /home/${user} couldn't be deleted" >&2
            exit 1
        fi
        echo "Home directory /home/${user} is deleted successfully"
    fi
done  
exit 0  

    



    

