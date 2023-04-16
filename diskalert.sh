#!/bin/bash
# Purpose: Monitor Server disk space and send an email alert to $ADMIN
ALERT=80 # alert level 
ADMIN="ravi.rkc@sws-international.com" # dev/sysadmin email ID
# Our Host server is defined by following variable
m1=s0.el.vlsiexpert.in
m2=s1.el.vlsiexpert.in
m3=corp001s1.el.vlsiexpert.in
m4=co-server-001.trg.vlsiexpert.in
m5=trg-setups-1.trg.vlsiexpert.in
#########################
for m in $m1 $m2 $m3 $m4 $m5
do

ssh $USER@$m df -H | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev' | awk '{ print $5 " " $1 }' | while read -r output;

do
  echo "---------$output----------$m ---------"
  echo
  usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1)   # Extract Disk uses partition from $output
  partition=$(echo "$output" | awk '{ print $2 }' )

  if [ $usep -ge $ALERT ]; then
    echo "Running out of space \"$partition ($usep%)\" on $m as on $(date)" |
    mail -s "Alert: Almost out of disk space $usep%" "$ADMIN"
  fi
done
done
