#!/bin/bash
<< Instruction
Check the username is correct or not if yourname enter correct name according to given name then welcome him
Instruction

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
