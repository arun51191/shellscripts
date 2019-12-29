log (){
    if [[ ${VERBOSE} = "true" ]]
    then
        echo "${@}"
    fi
}

usage () {

    echo "Invalid option" >&2
    echo "-v         enable verbose mode"
    echo "-l LENGTH lenght of the password"
    echo "-s         include special character"
    exit 1
}
LENGTH=16
while getopts vsl: OPTION
do
    case ${OPTION} in
    v)
        VERBOSE='true'
        log "verbose mode on"
        ;;
    s)
        SPECIALCHAR='true'
        log "special character is selected"
        ;;
    l)
        LENGTH=${OPTARG}
        log "length of the password is ${LENGTH}"
        ;;
    ?)
        usage
        ;;
    esac
done

log "Generating password"

password=$(date +%S%N|sha256sum|head -c "${LENGTH}") 

if [[ ${SPECIALCHAR} = 'true' ]]
then
    log "appending special character"
    specialchars="><%$#@()*="
    special_char=$(echo "$specialchars"|fold -w2|shuf|head -1)
    password="${password}${special_char}"
fi

echo "Password is: ${password}"



