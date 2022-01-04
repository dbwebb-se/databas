#!/usr/bin/env bash
. ".dbwebb/inspect-src/kmom.d/functions.bash"

TARGET_DIR="me/skolan"
CHECK_FILES="ddl.sql insert.sql insert-csv.sql kurs.csv kurstillfalle.csv dml-join2.sql dml-outer-join.sql dml-subquery.sql reset-part-3.sql skolan.sql"

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
