# !/bin/bash

read -t 20 -p "please input a num:" num
case "$num" in
	"10")
		echo "you input ten"
		;;
	"20")
		echo "you input twenty"
		;;
	30|[2][0-9][0-9])
		echo "you input a range"
		;;
	
	*)
		echo "you input a what?"
		;;

esac

