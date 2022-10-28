#!/bin/bash
# Create ,replace and rename the file to vlsi_expert_

function ex2b_14_soln() {
	if [ -d "/home/rsahani/mywork" ] ; then
		echo " ------New file in this directory ------"
		touch file{1..5}.txt 
		rename -v 's/.txt/.sh/' *.txt     #create file.txt and afterrename as file.sh
		ls -l file*.txt
	elif [ -f "file*.sh" ] ; then 
		echo " ------Replaced prifix is here-------"
		sed -i 's/file/vlsi_expert_/g' file*.sh          # replace the prifix of file*.sh to vlsi_expert_*.sh
	else
		echo "ERROR (ex2b_14): file*.txt are not present in this directory."
	fi
}

ex2b_14_soln

