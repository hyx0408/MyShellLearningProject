#!/bin/bash
#This shell script make the first letter of the direction names under current path capitalized.

print_info(){
	echo "********************************************************************"
	echo "Usage info:$0 [option] TargetDirectory "
	echo "One and only one should be used between following options."
	echo "Options:"
	echo "  -l(same as -L): make all sub directory first character to lower!"
	echo "  -u(same as -U): make all sub directory first character to upper!"
	echo "********************************************************************"
}

creat_recover_file(){
if [ -d ".uldfl.recover" ]
then
	echo "Changes are saved in \"""$2"".uldfl.recover/`date +%F-%T-%N`.info\"."
else
	mkdir .uldfl.recover
	echo "Changes are saved in \"""$2"".uldfl.recover/`date +%F-%T-%N`.info\"."
fi
}

if [ $# -eq 2 ]
then
	echo "Warnning: This operation is not completely reversible by itself!"
	read -n 1 -p "Do you want to continue [y/n]?" ofcourse
	echo ""
	if [ $ofcourse = "y" -o $ofcourse = "Y"  ]
	then
		CDIR=`ls -l $2 | grep ^d | awk '{print $9}'`
		i=0
		if [ $1 = "-u" -o $1 = "-U" ]
		then
			for name in $CDIR
			do
				temp=`echo $name | awk '{print toupper(substr($0,1,1))substr($0,2)}'`	
				if [ $name != $temp ] 
       		 		then
					((i++))
					oname="$2""$name"
					tname="$2""$temp"
					mv $oname $tname
                 			echo -e "$oname-->$tname" | tee -a "${2}.uldfl.recover/`date +%F-%T-%N`.info"
				fi
			done
			echo "Upper!"
		elif [ $1 == "-l" -o $1 == "-L"  ]
		then	
			for name in $CDIR
			do
				temp=`echo $name | awk '{print tolower(substr($0,1,1))substr($0,2)}'`
				if [ $name != $temp ] 
       			 	then
					((i++))
					mv "$2""$name" "$2""$temp"
                 			echo "$2""$name-->""$2""$temp" | tee -a "${2}.uldfl.recover/$(date +%F-%T-%N).info"
        			fi
			done
			echo "Lower!"
		else
			print_info
		fi
	else
		echo "Operation is cancelled!"
	fi
	if ((i!=0))
	then
		creat_recover_file
	fi
else
	print_info
fi

