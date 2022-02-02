#!/usr/bin/env bash

set -e

target="skolan"

mariadb < example/sql/inspect/setup_$target.sql

echo "[$ACRONYM] Loading me/skolan/$target.sql"
mariadb skolan < me/skolan/$target.sql

echo "SHOW TABLES;"
mariadb -t -e "SHOW TABLES;" $target
