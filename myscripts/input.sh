#!/bin/bash
### scripting for creating users

### Collecting the details interactively

echo "Creating new linux user:"

read -p "Enter the user name: " USERNAME

read -p "Enter the comment: " COMMENT

read -p "Enter the password: " PASSWORD

#### creating the user with entered details ####

useradd -c "${COMMENT}" -s /bin/bash -m "${USERNAME}"

### setting the password for the user

echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

### setting the password expiration once the user has logged in 


passwd -e "${USERNAME}"

 
