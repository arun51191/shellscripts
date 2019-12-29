#!/bin/bash
if [[ ! -e "${1}" ]]
then
echo "File doesn't exist: ${1}" >&2
exit 1
fi
LIMIT=10
echo "IPADDRESS : COUNT"
grep -i Failed "${1}" | awk '{print $(NF-3)}' | sort -nr | uniq -c | while read COUNT IPADDRESS
do
    if [[ "${COUNT}" -gt "${LIMIT}" ]]
    then
        echo "${IPADDRESS} : ${COUNT}"
    fi
done