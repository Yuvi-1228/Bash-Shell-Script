#! bin/bash
<< Demo
num=0
while [[ $num -le 5 ]]
do 
    echo "hora " $num
    num=$num+1 
done
Demo

# To find out even and odd number 
#!/bin/bash
num=1

while [ $num -le 10 ]
do
    #echo "Enter a number:"
    #read num

    if (( num % 2 == 0 )); then
        echo "$num is Even"
    else
        echo "$num is Odd"
    fi

    ((num++))
done
