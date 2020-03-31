#!/usr/bin/env bash

set -e

target="skolan"

mysql -udbwebb skolan < example/sql/inspect/setup_$target.sql
mysql -udbwebb skolan < .dbwebb/inspect-src/kmom.d/kmom02/dump_$target.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target
