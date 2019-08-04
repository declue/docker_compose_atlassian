#!/bin/bash


# init
if [ ! -d "backup" ]; then
	mkdir backup
fi

# check arg
if [ -z "$1" ]; then
	echo 'usage : ./jira_backup.sh [file_name]'
	exit 1
fi

# create backup folder
current_date=$(date +"%y-%m-%d")
mkdir -p backup/$current_date

echo "CURRENT DATE : $current_date"

# backup attachments
zip -r $1.zip data/jira/data 
mv $1.zip backup/$current_date/

# backup export data
file_name=$(ls data/jira/export/ -Aht | grep -v '^d' | head -1)
echo "FILE : $file_name"

cp data/jira/export/$file_name backup/$current_date/

