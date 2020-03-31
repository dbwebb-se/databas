#!/usr/bin/env bash

set -e

target="dbwebb"

mysql -udbwebb < example/sql/inspect/setup_${target}_no_drop.sql
mysql -udbwebb dbwebb < example/sql/transaction_ddl.sql

echo "SHOW TABLES;"
mysql -udbwebb -t -e "SHOW TABLES;" $target
