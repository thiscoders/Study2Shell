# !/bin/bash

num=1
while(($num<10))
	do
		printf $num
		printf "\r\n" 
		let "num++"
	done


while read -p "input:" info
	do
		echo "you output is $info"
		if [ "$info" == "q" ]
			then
				break
		fi
	done


# until

until(($num<0))
	do
		echo $num
		let "num--"
	done
