#!/bin/bash



# Put the loggin user as a input
read input

# Checking if input is UID or loggin

if [[ $input ]] && [ $input -eq $input 2>\dev\null ]

# If the input is UID
then
	echo "Number of terminals are :"
	cat /etc/passwd | grep $input -c
# If the input is Loggin name
else
	cat /etc/passwd>userlist
	echo "Number of terminals are :"
	grep -c $input userlist
fi
