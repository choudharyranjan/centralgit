#!/bin/bash

# To monitor the disk space of user home directory on the basis of user
ALERT='90%' #alert level 90 % of 2GB space 
#ADMIN="itsupport@vlsiexpert.in" # sysadmin email ID
MAX=2048


machines="`cat disk_monitor.cfg`"
folder_to_skip="aquota.group|aquota.user|lost|misc|vncuser"

for macrec in $machines
do
    machine=`echo $macrec | sed -e 's#:.*$##g' `
    folders=`echo $macrec | sed -e 's#^.*:##g' `
    for folder in `echo $folders | sed -e 's#,# #g' `
    do
	if [[ -z $machine || -z $folder ]] ; then
	    echo "Blank machine name or folder name in line $macrec "
	    continue
	fi
	#echo "Proecssing $folder for machine $machine "
	users=$(ssh $machine sudo ls -1 $folder | grep -vE '$folder_to_skip' )
	#echo " Got users $users"
	for user in $users
	do
	    usage=$(ssh $machine sudo du -sm $folder/$user | awk '{print $1}')
	    percent=`echo "scale=2; $usage / $MAX * 100" | bc`
	    if [ "$percent" > "$ALERT" ] ; then 
		    #echo "--------- $machine - $folder ---$user ==> $usage(MB)==>$percent % ----------------"
		    printf "Machine(%32s)    Folder(%12s)   User(%20s) : %8dMB      %f%%\n" $machine $folder $user $usage $percent
		    #echo "Warning: Your disk space usage is at $PERCENT%." | mail -s "Disk space usage warning" $user
		    #sleep 1
	    fi
	done
    done
done
exit 0

