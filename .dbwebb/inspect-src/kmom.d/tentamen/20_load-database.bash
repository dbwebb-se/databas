#!/usr/bin/env bash

set -e

target="exam"

sql="
DROP DATABASE IF EXISTS $target;
CREATE DATABASE $target;
"
#echo "Setup the database '$target'"
echo $sql | mariadb

echo "Load user database from sql/$target/backup.sql"
mariadb $target < me/tentamen/sql/$target/backup.sql

#echo "Executing: mariadb < example/sql/list_proc_func_trig.sql"
mariadb $target < example/sql/list_proc_func_trig.sql

echo "SHOW TABLES;"
mariadb -t -e "SHOW TABLES;" $target

echo "SELECT * FROM v_proc;"
mariadb -t -e "SELECT * FROM v_proc;" $target

echo "SELECT * FROM v_trig;"
mariadb -t -e "SELECT * FROM v_trig;" $target
