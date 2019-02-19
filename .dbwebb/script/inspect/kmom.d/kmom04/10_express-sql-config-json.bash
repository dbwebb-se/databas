#!/usr/bin/env bash

# Move to directory
cd me/kmom04/express-sql/config/db || exit
ls -l

# Check bank.json
cat bank.json
echo

# Modify settings in bank.json
cp bank.json bank_.json
config=$( node -e 'let json = require("./bank.json");json.host = "mysql";json.user = "user";json.password = "pass";json.port = 3306;json.database = "dbwebb"; console.log(JSON.stringify(json, null, 4));')
printf "%s\n" "$config" > bank.json

cat bank.json
echo
