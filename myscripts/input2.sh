### script for creating liunx user

### execute script only if it is executed by the root/sudo user

if [[ "${UID}" -ne 0 ]]
then
echo "Please execute script with root or sudo user."
exit 1
fi

### Collecting information to create user

read -p "Enter the user name: " USERNAME

read -p "Enter the password: " PASSWORD

read -p "Enter the full user name: " COMMENT

### creating the user

useradd -c "${COMMENT}" -s /bin/bash -m "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
echo "User couldn't be created"
exit 1
fi

### setting the password for the user

echo "${PASSWORD}" | passwd --stdin $USERNAME

if [[ "${?}" -ne 0 ]]
then
echo "User couldn't be created"
exit 1
fi

### making the password expires once the user logged in 

passwd -e "${USERNAME}"

if [[ "${?}" -ne 0 ]]
then
echo "User couldn't be created"
exit 1
fi

### printing the user details

echo "USER IS CREATED... THE BELOW ARE DETAILS."

echo "User name: ${USERNAME}"

echo "Password: ${PASSWORD}"

exit 0