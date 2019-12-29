log(){

    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${@}"
    fi

} 

usage(){

    
    echo "-L LENGHT length of the password"
    echo "-S to add select characters in password"
    echo "-V to enable verbose mode"
    echo " "
    exit 1
} 

LENGTH=22 ## setting default length

while getopts vsl: OPTION
do
    case ${OPTION} in
    v)
        VERBOSE='true'
        ;;
    s)
        SPEC_CHAR_ENABLED='true'
        ;;
    l)
        LENGTH=${OPTARG}
        ;;
    ?)
        echo "Invalid arguments given" >&2
        usage
        ;;
    esac
done

shift "$(( OPTIND - 1 ))"

if [[ "${#}" -gt 0 ]]
then
    echo ""
    echo "Extra parmeters given...." >&2
    usage
fi

log "Generating the password of lenght:${LENGTH}"

password=$(date +%S%N|sha256sum|head -c16)

if [[ "${SPEC_CHAR_ENABLED}" = 'true' ]]
then
    log " "
    log "appending special character"
    specialchars="><%$#@()*="
    special_char=$(echo "$specialchars"|fold -w2|shuf|head -1)
    password="${password}${special_char}"
fi
echo ""
echo "Password is: ${password}"
echo ""
exit 0

