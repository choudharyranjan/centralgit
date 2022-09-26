#!/bin/bash

# Gives a and b is input 

read a
read b

if [ "$a" != "$b" ]
then
	echo "Matched"
else
	echo "Not matching"
fi
