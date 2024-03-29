#!/usr/bin/env bash
. ".dbwebb/inspect-src/kmom.d/functions.bash"

TARGET_DIR="me/skolan"
CHECK_FILES="create-user.sql create-database.sql ddl-larare.sql insert-larare.sql dml-delete.sql ddl-alter.sql dml-update.sql dml-update-lonerevision.sql dml-select.sql reset-part-1.sql"

#setup.sql ddl.sql dml_insert.sql dml_delete.sql ddl_migrate.sql dml_update.sql dml_update_lonerevision.sql reset_part1.bash dml_select.sql"

cd $TARGET_DIR || exit 1

all=0
fail=0
for file in $CHECK_FILES; do
    (( all++ ))
    if [[ ! -f "$file" ]]; then
        printf "Missing file '$file'.\n"
        (( fail++ ))
    fi
done

doLog $fail "$TARGET_DIR: check files ("$(( all-fail ))"/$all)"
