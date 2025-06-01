#!/bin/bash

#  [ Single line comment]

<< comment 
this is multiple line comment 
comment

# Variable 

#name="Yuvi"

<< comment 
echo "Name is $name , date is $(date)"
echo "Enter your name"
read username
echo "Your name is $username"
comment


# Add username 
echo "For add username"
read -p "Enter your name: " username
sudo useradd -m $username
echo "Successfully added"

