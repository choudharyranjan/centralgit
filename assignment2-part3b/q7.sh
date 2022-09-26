#!/bin/bash

max=$#
for arg in "$@"
do
	if [[ "arg" -gt "$max" ]] 
	then
		$max="arg"
	fi
done

echo "Largest value is: $max"
