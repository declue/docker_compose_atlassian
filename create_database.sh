#!/bin/bash

echo "create confluence database"
sudo ./mysql_connect.sh 'create database confluence CHARACTER SET utf8 COLLATE utf8_bin;'

echo "create jira database"
sudo ./mysql_connect.sh 'create database jira CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;'


