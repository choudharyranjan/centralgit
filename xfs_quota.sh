#!/bin/bash


#Enable Disk Quota on xfs filesystem

##################################
#setting variable 
USER="/home/ravirc/users_file.txt"

for user in "cat $USER"
do 
	echo "------------Implementing quota on $user Complete----------"

	#setquota -u command take quota limit always in kb
	#setting user quota limit 2GB of each
	sudo setquota -u "$user" 2048 2048 0 0 /home
	sleep 1
	echo
done
# Check the status of imlementing quota

sudo xfs_quota -x -c 'report -bih' /home
