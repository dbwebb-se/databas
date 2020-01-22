#!/usr/bin/env bash

target="exam"

echo "OM PROBLEM:"
printf " 1. ERROR 1231 (42000) at line 179: Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'\n https://dbwebb.se/t/8381\n"

echo "Ladda filerna för hand, vid problem:
cd $HOME/repo/me/tentamen/sql/$target
mysql -udbwebb -ppassword $target < setup.sql
mysql -udbwebb -ppassword $target < ddl.sql
mysql -udbwebb -ppassword $target < insert.sql
"
echo
sql="
DROP DATABASE IF EXISTS $target;
CREATE DATABASE $target;
"
echo "Setup the database '$target'"
echo $sql | mysql -udbwebb

echo "Load user database from sql/$target/backup.sql"
mysql -udbwebb $target < me/tentamen/sql/$target/backup.sql

echo "Executing: mysql -udbwebb < example/sql/list_proc_func_trig.sql"
mysql -udbwebb $target < example/sql/list_proc_func_trig.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target

echo "SELECT * FROM v_proc;"
mysql -udbwebb -t -e "SELECT * FROM v_proc;" $target

echo "SELECT * FROM v_trig;"
mysql -udbwebb -t -e "SELECT * FROM v_trig;" $target 
