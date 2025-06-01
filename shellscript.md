# What is Shell command ?
# What is Bash ?
# What is Shell script ?

# Print Something 
```
echo "Hello World"
```
# Create Folder 
```
mkdir foldername

```
# list the folder and file 
```
ls
```
# list all teh folder and file even hidden file 
```
ls -a
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
# If your want run command under variable 
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

# add user 
```
sudo useradd -m $username
echo "congratulation successfully added"
```
