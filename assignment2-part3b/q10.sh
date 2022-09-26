#!/bin/bash

# Give filename by user


echo -n "enter your filename: "

read filename


#for checking the filename


if [ ! -f $filename ]
then 
	echo "File does not exist"
else
 	for i in $(cat $filename)
	do
		echo $i >> "TEMP"
	done

	#print the sorted value in ascending order.
	echo "$(sort "TEMP")"
fi
if [ -f "TEMP" ]
then
	rm "TEMP"
fi
