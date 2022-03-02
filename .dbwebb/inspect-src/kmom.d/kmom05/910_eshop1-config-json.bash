#!/usr/bin/env bash

# Quit if file is missing
path="me/kmom05/eshop1/config/db"
file="eshop"
[[ ! -f $path/$file.json ]] && echo "File '$path/$file.json' is missing!" && exit 1

# Move to directory
cd $path || exit

# Modify settings in config.json
cp $file.json ${file}_.json
config=$( node -e "let json = require('./$file.json');json.host = 'mariadb';json.user = 'user';json.password = 'pass';json.port = 3306;json.database = '$file'; console.log(JSON.stringify(json, null, 4));")
printf "%s\n" "$config" > $file.json
