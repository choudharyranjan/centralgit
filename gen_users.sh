#!/bin/bash

# This script takes a number 'n' as input and generates
#  1. n users-id strings and 
#  2. n password strings (with alphanumeric random pattern)
# It then generates users for generates user-id strings
# It sets the password for such users
# At end it displays user-id and password in output, one entry per screen in following format
#  <user-id> <password>

# This function adds users in system as per spec
# input
# 1) An array of users in users
# 2) An arrray of names in names
function add_users_to_system() {
    echo "Generating users"
    i=0
    numusers="${numusers[*]}"
    while [[ $i -lt $numusers ]] 
    do 
	user="${users[$i]}"
        name="${names[$i]}"
        echo "User[$i] to be created is $user ($name) "
	useradd $user -c "${name},,,," -b ${home_base} -s /bin/bash -N -m -g ${common_group}
	#adduser $user -c "${name},,,," -G ${common_group}
	i=$(( i + 1 ))
    done
}

# This function set passwords for users in system as per spec
# input
# 1) An array of users in users
# 2) An array of passwords in  passwords
function set_users_pwd_in_system() {
    echo "Setting passwords"
    tmpfile="`mktemp`"
    i=0
    numusers="${numusers[*]}"
    while [[ $i -lt $numusers ]] 
    do 
	user=${users[$i]}
	password=${passwords[$i]}
	echo "$user:$password" >> $tmpfile
	i=$(( i + 1 ))
    done
    echo "Input contents in $tmpfile "
    cat $tmpfile
    chpasswd < $tmpfile
    rm -f $tmpfile 
}

# ===========================================================================
# This function takes as input FILE to read users from
# It then puts
# USER ids in @users 
# Names in @names
# and their Password in @passwords
# ===========================================================================
function gen_users_strings() {
    filename=$1
    if [[ ! -f $filename ]] ; then
	echo "ERROR file filename doesnot exists"
	exit 2
    fi
    numusers="`cat $filename | wc -l `"
    echo "numusers=$numusers"
    if [[ $numusers -lt 1 ]] ; then
	echo "ERROR in numbers ($numusers) "
	exit 3
    fi
    prefix=""
    users=()
    names=()
    passwords=()
    echo "Processing records"
    while read record
    do
	# Columns
	# 2 -> User Name
	# 5 -> User ID
        userid="${prefix}`echo $record |  cut -d',' -f3 | sed -e 's|@.*$||' `"
        username="`echo $record |  cut -d',' -f2 `"
        userpassword="`head -3 /dev/urandom | tr -dc A-Za-z0-9_ | head -c9 `"
        #echo "Created user and password for ${userid} ($username) => $userpassword "
	users+=($userid)
        names+=("${username}")
	passwords+=($userpassword)
    done < $filename
}

function get_listing() {
    echo "Get listing  "
    ls -l ${home_base}
}
if [[ $# -le 0 ]] ; then
    echo "No arguments supplied ($#)"
    exit 1
fi
users_file=$1

# ----- Set base values -----------
home_base=/ve/c001home/
common_group=govlsi

groupadd $common_group
gen_users_strings $users_file
add_users_to_system
set_users_pwd_in_system
get_listing
