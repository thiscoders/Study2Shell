#!/bin/bash

currentuser=$(env | grep "USER=" | cut -d "=" -f 2)

if [ "$currentuser" == "root" ]
	then
		echo "welcome root"
elif [ "$currentuser" == "kakaxi" ]
	then
		echo "welcome kakaxi"
else
	echo "who are U? $currentuser"
fi
