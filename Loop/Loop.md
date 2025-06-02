# For Loop 
- A for loop in programming is a control structure used to repeat a block of code a certain number of times. It's commonly used when you know in advance how many times you want to loop.

# Loop For and while 

```
#!/bin/bash
for (( f=1 ; f<=5; num++ ));
do 
    echo "My name is repeat"
    mkdir repeat 5 
done
```

# Now If you want to create multiple folder 
- 1 is argument 1 which is folder name
- 2 is Start Range 
- 3 is End Range

```
for (( fol=$2; fol<=$3; fol++))
do 
    mkdir "$1$fol"
done
```
# run the command in terminal for create multiple folder 
```
bash loop.sh foldername startRange endRange
```

# While Loop 
