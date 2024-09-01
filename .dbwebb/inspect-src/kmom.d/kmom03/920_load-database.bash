#!/usr/bin/env bash

set -e

target="skolan"

mariadb < example/sql/inspect/setup_$target.sql

echo "[$ACRONYM] Loading me/skolan/$target.sql"
#mariadb skolan < me/skolan/$target.sql
tail -n +2 me/skolan/$target.sql | mariadb $target 

echo "SHOW TABLES;"
mariadb -t -e "SHOW TABLES;" $target
