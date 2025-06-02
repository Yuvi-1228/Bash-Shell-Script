#! bin/bash 

function create_directory()
{
    mkdir demo
}

if ! create_directory; then 
    echo "the code is being exited as the directory already exists"
    exit 1
fi 
echo " This should not work because the code is interrupted"