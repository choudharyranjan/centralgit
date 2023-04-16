#!/bin/bash

while read line; do
    username=$(echo $line | cut -d ' ' -f 1)
    password=$(echo $line | cut -d ' ' -f 2)
    name=$(echo $line | cut -d ' ' -f 3)
    useradd $username -c "$name,,,,,,"
    echo "$username:$password" | chpasswd
done < users.txt

