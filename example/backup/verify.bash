#!/usr/bin/env bash
BACKUP=${1:-eshop.sql}
TARGET_DB="verify"

printf "Loading backup file '%s' into db '$TARGET_DB'.\n" "$BACKUP"

mariadb -e "DROP DATABASE IF EXISTS $TARGET_DB;"
mariadb -e "CREATE DATABASE $TARGET_DB;"
mariadb "$TARGET_DB" < "$BACKUP"
mariadb "$TARGET_DB" < ../sql/list_proc_func_trig.sql
mariadb -e "USE $TARGET_DB; SHOW TABLES;"
mariadb -e "USE $TARGET_DB; SELECT * FROM v_proc;"
mariadb -e "USE $TARGET_DB; SELECT * FROM v_trig;"
