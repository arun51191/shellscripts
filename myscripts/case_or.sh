usage(){
    echo "It should be yes or no only" >&2
    exit 1
}

read -p "Are you idiot? say yes or no:" response

case "${response}" in

yes|YES) 
        echo "you are an idiot!!"
        ;;

no|NO)
        echo "you said no. But I know you are an idiot!"
        ;;
*)          
        usage
        ;;
esac
