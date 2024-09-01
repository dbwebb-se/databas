#!/usr/bin/env bash

set -e

target="eshop"

# Quit if file is missing
file="me/kmom10/eshop3/sql/eshop/backup.sql"
[[ ! -f $file ]] && echo "File '$file' is missing!" && exit 1

mariadb -udbwebb < example/sql/inspect/setup_eshop.sql

#mariadb -udbwebb $target < me/kmom10/eshop3/sql/eshop/backup.sql
tail -n +2 me/kmom10/eshop3/sql/eshop/backup.sql | mariadb $target 

mariadb -udbwebb $target < example/sql/list_proc_func_trig.sql

mariadb -udbwebb -t -e "SHOW TABLES;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_proc;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_trig;" $target
