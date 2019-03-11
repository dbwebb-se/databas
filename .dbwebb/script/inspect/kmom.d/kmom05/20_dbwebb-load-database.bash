#!/usr/bin/env bash

echo "OM PROBLEM:"
printf " 1. ERROR 1231 (42000) at line 179: Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'\n https://dbwebb.se/t/8381\n"

echo
echo "Executing: mysql -udbwebb < example/sql/inspect/setup_eshop.sql"
mysql -udbwebb < example/sql/inspect/setup_eshop.sql

echo "Executing: mysql -udbwebb eshop < me/kmom05/eshop1/sql/eshop/backup.sql"
mysql -udbwebb eshop < me/kmom05/eshop1/sql/eshop/backup.sql
