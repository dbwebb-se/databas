#!/usr/bin/env bash

# Move to directory
cd me/kmom02/terminal1 || exit
ls -l

# Check config.json
cat config.json
echo

cp config.json config_.json
echo '
{
    "host":     "mysql",
    "user":     "user",
    "password": "pass",
    "database": "skolan"
}
' > config.json
