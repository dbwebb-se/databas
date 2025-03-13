#!/usr/bin/env bash

set -e

target="eshop"

backup="me/kmom05/eshop1/sql/eshop/backup.sql"
version=$(grep '^-- Server version' "$backup" | awk '{print $4}' | cut -d'-' -f1)
#echo "$version"
if [[ $(echo -e "$version\n10.6" | sort -V | head -n 1) == "$version" && "$version" != "10.6" ]]; then
    echo "Version '$version' is pre-10.6."
    mariadb -udbwebb < example/sql/inspect/setup_eshop_pre10.6.sql
else
    echo "Version '$version' is 10.6 or newer."
    mariadb -udbwebb < example/sql/inspect/setup_eshop.sql
fi

#mariadb -udbwebb $target < me/kmom05/eshop1/sql/eshop/backup.sql
tail -n +2 "$backup" | mariadb $target 

mariadb -udbwebb $target < example/sql/list_proc_func_trig.sql

mariadb -udbwebb -t -e "SHOW TABLES;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_proc;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_trig;" $target
