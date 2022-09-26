#!/bin/bash

function_exp1 (){
	echo " Execute docker-container openssh-super "
	ssh local@172.17.0.2 ls -la
	

	function_exp2
}

function_exp2 (){ 
	echo "Updating file from local to /tmp of docker running container"

	if [[ -f "/home/rsahani/workarea/infra-utils/linux/login.csv" ]]
	then
	    scp -r /home/rsahani/workarea/infra-utils/linux/login.csv local@172.17.0.2:/tmp
	
	    echo " Copied successfully "
	else
		echo " Path is wrong copied not happend "
	fi
	function_exp3
}


function_exp3(){
	echo " Copies a script gusers.sh to /tmp folder "
	
	echo
	if [[ -f "/home/rsahani/workarea/infra-utils/linux/gusers.sh" ]]
	then
		scp -r /home/rsahani/workarea/infra-utils/linux/gusers.sh local@172.17.0.2:/tmp 
		ssh local@172.17.0.2 " ls -la /tmp " 
		
		echo " Copied Successfull "
	else
		echo " Path wrong copied don't happense "
	fi

	function_run_scripts
}


function_run_scripts() {
    echo " Running scripts remotely from container "
     
	echo

    ssh local@172.17.0.2 "cd /tmp ; ./gusers.sh " 

}


 # calling of all function
	function_exp1





