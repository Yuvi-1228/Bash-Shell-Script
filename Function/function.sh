#! bin/bash
# This is function create 
function my_world ()
{
read -p "Enter the name:" username
read -p "Enter your code:" code
if [[ $username == "Yuvi" ]];
then    
    echo "Welcome to my world"
elif [[ $code -ge 12 ]];
then
    echo "Welcome to my world"
else
    echo "Sorry This is not your home"
fi
}

# This is calling function 
my_world