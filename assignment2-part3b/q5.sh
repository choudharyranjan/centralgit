#!/bin/bash


read userinput

case $userinput in
   1) lslogins -o USER ;;
   2) who --count | grep users ;;
   3)  who -q | grep -v users ;;
   4) groups ;;
   *) echo -e "Please Enter Correct Input \n" ;;
esac
