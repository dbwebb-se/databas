#!/usr/bin/env bash

set -e

target="skolan"

echo "[$ACRONYM] Loading me/skolan/$target.sql"

mysql -udbwebb skolan < me/skolan/$target.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target
