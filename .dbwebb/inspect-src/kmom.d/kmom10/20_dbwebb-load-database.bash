#!/usr/bin/env bash

set -e

target="eshop"

echo "OM PROBLEM:"
printf " 1. ERROR 1231 (42000) at line 179: Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'\n https://dbwebb.se/t/8381\n---\n"

echo
echo "Executing: mysql -udbwebb < example/sql/inspect/setup_eshop.sql"
mysql -udbwebb < example/sql/inspect/setup_eshop.sql

echo "Executing: mysql -udbwebb eshop < me/kmom10/eshop3/sql/eshop/backup.sql"
mysql -udbwebb $target < me/kmom10/eshop3/sql/eshop/backup.sql

echo "Executing: mysql -udbwebb < example/sql/list_proc_func_trig.sql"
mysql -udbwebb $target < example/sql/list_proc_func_trig.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target

echo "SELECT * FROM v_proc;"
mysql -udbwebb -t -e "SELECT * FROM v_proc;" $target

echo "SELECT * FROM v_trig;"
mysql -udbwebb -t -e "SELECT * FROM v_trig;" $target 
