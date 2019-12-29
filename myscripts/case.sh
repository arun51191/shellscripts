#!/bin/bash
case "${1}" in     
    start)
        echo "Starting."
        ;;
    stop)
        echo "Stopping."
        ;;
    status|state|--status|--state)
        echo "Status:"
        ;;
    *)
        echo "Invalid argument" >&2
        exit 1
        ;;
esac