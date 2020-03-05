#!/usr/bin/env bash

set -e

echo "mysql -udbwebb dbwebb < example/sql/inspect/setup_dbwebb_no_drop.sql"
echo "mysql -udbwebb dbwebb < example/sql/transaction_ddl.sql"
echo "---"

echo "Executing: mysql -udbwebb dbwebb < example/sql/inspect/setup_dbwebb_no_drop.sql"
mysql -udbwebb dbwebb < example/sql/inspect/setup_dbwebb_no_drop.sql

echo "Executing: mysql -udbwebb dbwebb < example/sql/transaction_ddl.sql"
mysql -udbwebb dbwebb < example/sql/transaction_ddl.sql
