#!/bin/bash

m1=s0.el.vlsiexpert.in
m2=s1.el.vlsiexpert.in
m3=corp001s1.el.vlsiexpert.in
m4=trg-setups-1.trg.vlsiexpert.in
m5=co-server-001.trg.vlsiexpert.in

for M in $m1 $m2 $m3 $m4 $m5 
do
	echo "----------------------printing the licenses Currently used in Machine $M ----------------------------"
	ssh $USER@$M "ps -eaf |grep usr.*synopsys.*bin | grep -v grep" 

	echo	
done

