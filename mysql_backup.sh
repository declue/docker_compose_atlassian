#!/bin/bash

DB_USER=sqluser
DB_HOST=172.17.0.1
SSL_OPTION='--ssl-ca=certs/ca.pem --ssl-cert=certs/client-cert.pem --ssl-key=certs/client-key.pem'

# init
if [ ! -d "backup" ]; then
	mkdir backup
fi

for db in $(mysql --user=$DB_USER -h $DB_HOST $SSL -e 'show databases' -s --skip-column-names | grep -vi information_schema); do
	if [ "$db" == "sys" ]; then continue; fi
	if [ "$db" == "performance_schema" ]; then continue; fi
	if [ "$db" == "mysql" ]; then continue; fi	
	file_name=mysql-$db-$(date +%y-%m-%d).gz
	echo $file_name
	rm backup/$file_name
	mysqldump --user=$DB_USER --host $DB_HOST $SSL --opt $db | gzip > backup/$file_name
done




