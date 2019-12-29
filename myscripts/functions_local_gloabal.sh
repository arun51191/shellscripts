#!/bin/bash
function myfun(){

    my_global_name="Arun"
    local my_local_name="Raja"
    echo ""
    echo "Output inside the function"
    echo "My global name is : ${my_global_name}"
    echo "My local name is : ${my_local_name}"
}

myfun
echo ""
echo "Output outside of the function"
echo "My global name is : ${my_global_name}"
echo "My local name is : ${my_local_name}"