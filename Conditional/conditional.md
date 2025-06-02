# Conditional if then else 
## and close by fi 
```
read -p "Enter the name:" username
read -p "Enter your Code: " code
if [[$username == "Yuvi"]];
then
    echo "You are Welcome"
elif [[ $code -ge 12 ]];
then
    echo "You are Welcome"
else
    echo "Sorry Please check your name"
fi
```
