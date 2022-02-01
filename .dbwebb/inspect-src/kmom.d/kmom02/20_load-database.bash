#!/usr/bin/env bash

set -e

target="skolan"

mariadb < example/sql/inspect/setup_$target.sql
mariadb skolan < .dbwebb/inspect-src/kmom.d/kmom02/backup_${target}2.sql

echo "SHOW TABLES;"
mariadb -t -e "SHOW TABLES;" $target
