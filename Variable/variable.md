# Print Something 
```
echo "Hello World"
```
# Crate shell script file 
```
vi script.sh
```
# Now, Write script inside your .sh file 

```
#! /bin/bash
#This is first shell script 
echo "Hello World"
echo "this command just print your command"
```
# Now , Give permission and make executable file 
```
chmod 754 filename
```
# Now, run the script 
```
./filename.sh
```

# varible identified with $ [dollor sign]
```
name = "Yuvi"
echo "Name is $name"

```
# If your want run command under variable use ()
```
name = "Yuvi"
echo "Name is $name, and date is $(date)"
```
# If you want to input from user 
```
echo "Enter your name"
read username
echo "Your name id $username"

``` 

# add new user 
```
sudo useradd -m $username
echo "congratulation successfully added"
```
