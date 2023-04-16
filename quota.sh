#!/bin/bash

# Setting the user path in the variable 
QUOTA_FILE="/home/ravirc/users_file.txt"
#QUOTA_LIMIT='limit bsoft=1024m bhard=1024m  "$username"'

###################################################################

# Enable quota for each user in my /home directory
while read -r username; do
	echo "-------Implimenting quota on $username is Complete --------"

  # Set the user's quota limits to 2GB for both soft and hard limits
  #In above centos 7 version we mention limit in MB.
  #In centOS 7 or RHEL 7 version we only mention quota limit in KB.

  sudo  setquota -u $username 2048000 2048000 0 0 /home
  echo
  sleep 1
done < "$QUOTA_FILE"

####################################################################
# Check the quota status are implimenting.

sudo xfs_quota -x -c "report -bih" /home

