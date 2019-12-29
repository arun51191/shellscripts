#!/bin/bash
if [ "${UID}" -ne 0 ]
then
    echo "This script accepts only root/sudo users only"
    exit 1
fi

if [ "${#}" -lt 1 ]
then
    echo "Please enter atleast the username to add into the linux machine:"
    exit 1
fi

username="${1}" ## taking the first argument as user name

comment="${*}" ## taking all the arguments as a string for the comment

## adding the user

useradd -s /bin/bash -m -d /home/"${username}" -c "${comment}" "${username}"

if [ "${?}" != 0 ]
then
    echo "User couldn't be created"
    exit 1
fi

## setting the password for the user

password=$(date +%S%N|sha256sum|head -c16)

echo "${password}" | passwd --stdin "${username}" > /dev/null

if [ "${?}" != 0 ]
then
    echo "password couldn't be set for the user"
    echo "But the user is created with the username: ${username}"
    exit 1
fi

### force the user to reset his password for his first login

passwd -e "${username}" > /dev/null

echo "User is created with the username ${username} on the host ${HOSTNAME}"
echo "Initial password for the user is: ${password}"
echo "User has to reset his password after his first login."