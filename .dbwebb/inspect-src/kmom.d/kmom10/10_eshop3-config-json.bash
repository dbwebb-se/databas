#!/usr/bin/env bash

# Move to directory
cd me/kmom10/eshop3/config/db || exit
ls -l

# Quit if file is missing
[[ ! -f eshop.json ]] && echo "File 'eshop.json' is missing!" && exit 1

# Check eshop.json
cat eshop.json
echo

# Modify settings in eshop.json
cp eshop.json eshop_.json
config=$( node -e 'let json = require("./eshop.json");json.host = "mysql";json.user = "user";json.password = "pass";json.port = 3306;json.database = "eshop"; console.log(JSON.stringify(json, null, 4));')
printf "%s\n" "$config" > eshop.json

cat eshop.json
echo
