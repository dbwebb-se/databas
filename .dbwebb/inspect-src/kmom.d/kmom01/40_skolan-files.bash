#!/usr/bin/env bash
cd me/skolan || exit 1

echo "[$ACRONYM] Check if all 'skolan' files are available."

files=(
    "setup.sql"
    "ddl.sql"
    "dml_insert.sql"
    "dml_delete.sql"
    "ddl_migrate.sql"
    "dml_update.sql"
    "dml_update_lonerevision.sql"
    "reset_part1.bash"
    "dml_select.sql"
)

success=0
for path in "${files[@]}"; do
    if [[ ! -f $path ]]; then
        printf "Missing file '%s'\n" "$path"
        success=1
    fi
done

exit $success
