#!/bin/bash
CMD=
if [[ ! -z "$1" ]]; then
	CMD=' -e "'$1'"'
fi

SQL_CMD='sudo mysql -u sqluser -h 172.17.0.1 --ssl-ca=./certs/ca.pem --ssl-cert=./certs/client-cert.pem --ssl-key=./certs/client-key.pem'$CMD

eval $SQL_CMD
