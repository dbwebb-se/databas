#!/usr/bin/env bash
DATABASE=${1:-eshop}

printf "Taking a backup of the database '%s'.\n" "$DATABASE"

mysqldump --routines --result-file="$DATABASE".sql "$DATABASE"
ls -l "$DATABASE".sql
