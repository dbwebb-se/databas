#!/usr/bin/env bash
. ".dbwebb/inspect-src/kmom.d/functions.bash"

TARGET_DIR="me/kmom10/try2"
CHECK_FILES="config/db/exam.json doc/er.pdf index.js cli.js sql/exam/backup.sql sql/exam/setup.sql sql/exam/ddl.sql sql/exam/insert.sql sql/exam/dml.sql "

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
