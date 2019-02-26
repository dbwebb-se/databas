#!/usr/bin/env bash

echo "Executing: mysql -udbwebb < example/sql/inspect/setup_eshop.sql"
mysql -udbwebb < example/sql/inspect/setup_eshop.sql

echo "Executing: mysql -udbwebb eshop < me/kmom05/eshop1/sql/eshop/backup.sql"
mysql -udbwebb eshop < me/kmom05/eshop1/sql/eshop/backup.sql
