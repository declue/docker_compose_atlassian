#!/bin/bash


# init
if [ ! -d "backup" ]; then
	mkdir backup
fi

# check arg
if [ -z "$1" ]; then
	echo 'usage : ./confluence_backup.sh [file_name]'
	exit 1
fi

# create backup folder
current_date=$(date +"%y-%m-%d")
mkdir -p backup/CONFLUENCE_$current_date

echo "CURRENT DATE : $current_date"

# backup attachments
zip -r $1.zip data/confluence/attachments/ 
mv $1.zip backup/CONFLUENCE_$current_date/

# backup export data
file_name=$(ls data/confluence/backups/ -Aht | grep -v '^d' | head -1)
echo "FILE : $file_name"

cp data/confluence/backups/$file_name backup/CONFLUENCE_$current_date/

