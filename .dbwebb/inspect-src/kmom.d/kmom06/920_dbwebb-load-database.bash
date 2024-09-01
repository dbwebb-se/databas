#!/usr/bin/env bash

set -e

target="eshop"

mariadb -udbwebb < example/sql/inspect/setup_eshop.sql

#mariadb -udbwebb $target < me/kmom06/eshop2/sql/eshop/backup.sql
tail -n +2 me/kmom06/eshop2/sql/eshop/backup.sql | mariadb $target 

mariadb -udbwebb $target < example/sql/list_proc_func_trig.sql

mariadb -udbwebb -t -e "SHOW TABLES;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_proc;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_trig;" $target
