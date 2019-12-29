usage(){
    echo "It should be yes or no only" >&2
    exit 1
}

read -p "Are you an idiot? " response

case "$response" in 

[yY]|[yY][eE][sS])

        echo "I know you are an idiot!"
        ;;

[nN]|[nN][oO])
        echo "you said no. But I am pretty sure you are an idiot!"
        ;;
*)      
        usage
        ;;
esac