#!/usr/bin/env bash

set -e

target="eshop"

backup="me/kmom06/eshop2/sql/eshop/backup.sql"
version=$(grep '^-- Server version' "$backup" | awk '{print $4}' | cut -d'-' -f1)
os=$(grep '^-- MariaDB dump' "$backup" | awk -F 'for ' '{print $2}' | awk '{print $1}')
os1=$(grep '^-- MySQL dump' "$backup" | awk -F 'for ' '{print $2}' | awk '{print $1}')
os=${os:-"$os1"}

#echo "$version"
if [[ $(echo -e "$version\n10.6" | sort -V | head -n 1) == "$version" && "$version" != "10.6" ]]; then
    echo "Version '$version' is pre-10.6 on $os."
    mariadb -udbwebb < example/sql/inspect/setup_eshop_pre10.6.sql
elif [[ "${os:0:3}" == "osx" && "$(echo -e "$version\n11.6.2" | sort -V | head -n 1)" == "$version" ]]; then
    echo "Version '$version' is 11.6.2 or older on $os."
    mariadb -udbwebb < example/sql/inspect/setup_eshop_11.6_osx.sql
elif [[ "${os:0:6}" == "debian" && "$(echo -e "$version\n11.4.0" | sort -V | head -n 1)" == "$version" ]]; then
    echo "Version '$version' is 11.4.0 or older on $os."
    mariadb -udbwebb < example/sql/inspect/setup_eshop_utf8mb4_general_ci.sql
else
    echo "Version '$version' is 10.6 or newer on $os."
    mariadb -udbwebb < example/sql/inspect/setup_eshop.sql
fi

#mariadb -udbwebb $target < me/kmom05/eshop1/sql/eshop/backup.sql
tail -n +2 "$backup" | mariadb $target 

mariadb -udbwebb $target < example/sql/list_proc_func_trig.sql

mariadb -udbwebb -t -e "SHOW TABLES;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_proc;" $target
mariadb -udbwebb -t -e "SELECT * FROM v_trig;" $target
