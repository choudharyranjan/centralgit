#!/bin/bash

# to get unlimited no of argument as a vlsi_expert_name

#function ex2b_7() {
	 export vlsi_expert_name="$@"
	if [ -f "$vlsi_expert_name" ]
	then
		echo " $vlsi_expert_name vlsi_expert_ is exist and regular vlsi_expert_"
	else
		echo "$vlsi_expert_name vlsi_expert_ not found"
	fi


#}
#ex2b_7

