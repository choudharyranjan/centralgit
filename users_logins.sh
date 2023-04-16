#!/bin/bash

# In this script I try to extract users logins data by per users.
#For one month of the data
#And some manipulation are to be done in this data and after getting this typ of 
#data.

##########################################################################

#echo " --------Printing last logins of users-----------" 

 sudo last -f /var/log/wtmp | grep -vE '^wtmp' | awk 'NF > 0' | awk -F " " '{print $1"," $2"," $4"-"$5"-"$6","$7"," $9","$10}' > ~/logins_data.txt
 sleep 2 
#After extract the data output are apend into /home/ravirc/logins_data.txt file

##########################################################################
##### Adding the hostname in extracted data
 sudo sed -i 's/$/,s1.el.vlsiexpert.in/g' /home/ravirc/logins_data.txt

 sleep 2
########################################################################## 
##### Setting the Header of the csv file

 sudo awk 'BEGIN{print "User_id,Terminal,Date,Start,End,Total_Used,Userhost"}1' logins_data.txt > /dev/null 

 sleep 2
##########################################################################

######## Listing of the data 
 
# cat -n /home/ravirc/logins_data.txt


##
