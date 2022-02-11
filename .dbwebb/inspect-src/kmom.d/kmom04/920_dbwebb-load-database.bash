#!/usr/bin/env bash

set -e

target="dbwebb"

mariadb -udbwebb < example/sql/inspect/setup_${target}_no_drop.sql
mariadb -udbwebb dbwebb < example/sql/transaction_ddl.sql
mariadb -udbwebb -t -e "SHOW TABLES;" $target
