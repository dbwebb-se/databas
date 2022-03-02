#!/usr/bin/env bash

set -e

target="eshop"

mariadb -udbwebb < example/sql/inspect/setup_eshop.sql
mariadb -udbwebb $target < me/kmom05/eshop1/sql/eshop/backup.sql
mariadb -udbwebb $target < example/sql/list_proc_func_trig.sql

mariadb -udbwebb -t -e "SHOW TABLES;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_proc;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_trig;" $target
