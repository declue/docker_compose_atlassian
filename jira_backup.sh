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
<<<<<<< HEAD
mkdir -p backup/JIRA_$current_date
=======
mkdir -p backup/$current_date
>>>>>>> d440d581c9820a3ed88d90da5537f4dd56097076

echo "CURRENT DATE : $current_date"

# backup attachments
zip -r $1.zip data/jira/data 
<<<<<<< HEAD
mv $1.zip backup/JIRA_$current_date/
=======
mv $1.zip backup/$current_date/
>>>>>>> d440d581c9820a3ed88d90da5537f4dd56097076

# backup export data
file_name=$(ls data/jira/export/ -Aht | grep -v '^d' | head -1)
echo "FILE : $file_name"

<<<<<<< HEAD
cp data/jira/export/$file_name backup/JIRA_$current_date/
=======
cp data/jira/export/$file_name backup/$current_date/
>>>>>>> d440d581c9820a3ed88d90da5537f4dd56097076

