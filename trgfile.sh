#!/bin/bash
Admin=ravirc
for admin in $Admin
do 
   ssh $admin@trg-setups-1.trg.vlsiexpert.in
   user1=deepak
   user2=kanika
   user3=niti
   user4=rajat

     for USER in $user1 $user2 $user3 $user4
     do 
	echo "----------Display all the content in all $USER home directory----------"
	sudo su - $USER
	sudo ls -l /home/$USER
	sudo tree -d
	echo
	
     done
     exit

done
