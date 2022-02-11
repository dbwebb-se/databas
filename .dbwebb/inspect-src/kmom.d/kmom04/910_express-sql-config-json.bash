#!/usr/bin/env bash

# Move to directory
cd me/kmom04/express-sql/config/db || exit

# Quit if file is missing
file="bank"
[[ ! -f $file.json ]] && echo "File '$file.json' is missing!" && exit 1

# Modify settings in config.json
cp $file.json ${file}_.json
config=$( node -e "let json = require('./$file.json');json.host = 'mariadb';json.user = 'user';json.password = 'pass';json.port = 3306;json.database = 'dbwebb'; console.log(JSON.stringify(json, null, 4));")
printf "%s\n" "$config" > $file.json
