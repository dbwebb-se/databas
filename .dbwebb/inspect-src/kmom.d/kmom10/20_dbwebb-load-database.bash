#!/usr/bin/env bash

set -e

target="eshop"

mysql -udbwebb < example/sql/inspect/setup_eshop.sql
mysql -udbwebb $target < me/kmom10/eshop3/sql/eshop/backup.sql
mysql -udbwebb $target < example/sql/list_proc_func_trig.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target

echo "SELECT * FROM v_proc;"
mysql -udbwebb -t -e "SELECT * FROM v_proc;" $target

echo "SELECT * FROM v_trig;"
mysql -udbwebb -t -e "SELECT * FROM v_trig;" $target
