#!/bin/bash

hello() {
    for name in "$@"
    do
        echo "Hello ${name}! How are you? "
    done
} 
    
hello arun parth teja