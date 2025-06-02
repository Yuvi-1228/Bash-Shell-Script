#!/bin/bash

# This script for and while loop 
#for (( f=1; f<=5; f++ ));
#do
    #mkdir "$1$f"
#done
######################################################
# Create huge amount of folder 
for ((num=$2; num<=$3 ; num++))
do 
    mkdir "$1$num"
done

