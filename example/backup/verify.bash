#!/usr/bin/env bash
DATABASE=${DATABASE:-eshop}
TARGET="verify"

printf "Loading backup file '%s.sql' into db 'verify'.\n" "$DATABASE"

mariadb -e "DROP DATABASE IF EXISTS $TARGET;"
mariadb -e "CREATE DATABASE $TARGET;"
mariadb "$TARGET" < "$DATABASE".sql
mariadb "$TARGET" < ../sql/list_proc_func_trig.sql
mariadb -e "USE $TARGET; SHOW TABLES;"
mariadb -e "USE $TARGET; SELECT * FROM v_proc;"
mariadb -e "USE $TARGET; SELECT * FROM v_trig;"
