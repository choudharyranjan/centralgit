#!/bin/bash

# Given string
string="abc,xyz,jkl,raw"

# setting IFS value
IFS=','

# Reading The split string into array

read -ra arr <<< "$string"

# print each value of the array
for val in "${arr[@]}";
do
  printf "name = $val\n"
done


# In this script missing "," to IFS and option "read -ra". 
