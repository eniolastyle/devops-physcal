#! /usr/bin/bash

############################################
#
# Convert pdf to txt, Rename files & Backup.
#
############################################

#Getting all pdf files from the current dir
date
echo
FILES=./*.pdf
echo $FILES
echo

#Converting one file at a time with for loop
i=1
for f in $FILES
do
	echo "Processing $i file for conversion..."
	echo
	pdftotext -enc UTF-8 $f
	i=$(( i + 1 ))
	echo "File convert successful!"
	echo
done

#Renaming all converted files...
NEWFILES=./*.txt

j=1
for n in $NEWFILES
do
	mv $n "conv$j.txt"
	echo "$j file renamed..."
	echo
	j=$(( j + 1 ))
done

#Moving renamed files to a new folder
mkdir converts
mv ./*.txt ./converts

#Creating the backup...
mkdir backup

files=./converts    #file to backed up
dest=./backup       #backup destination

archive_file="$(hostname -s)-$(date +%A).tgz"

echo
echo "Backing up $files to $dest/$archive_file"
echo
echo


tar czf $dest/$archive_file $files

echo
echo "Backup finished"
date
echo
