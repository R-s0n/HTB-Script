#!/bin/bash

if [[ -n "$1" && -n "$2" ]]; then
	echo "Working..."
	cd /home/rs0n/HTB/
	exists=`ls | grep $1`
	if [[ -n "$exists" ]]; then
		read -p "This will delete the $1 folder, including all its contents. Are you sure? [Press Enter to Continue]"
		rm -rf $1
	fi
	mkdir $1
	cd $1
	echo "*************
* USERNAMES *
*************" > usernames
	echo "*************
* PASSWORDS *
*************" > passwords
	echo "*************
* NMAP SCAN *
*************" > enum
	../nmapAutomator.sh $2 All > enum
	rm -rf $2
	echo "Done!"
else
	echo "Usage: ./htb.sh [NAME] [IP]"
fi
