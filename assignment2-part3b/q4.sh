#!/bin/bash

function factorial(){
  v1=$2
   n=1
  while [[ $v1 -gt 0 ]]
  do
	v1=$(($v1 - 1))
  done
	echo $n
}

factorial
