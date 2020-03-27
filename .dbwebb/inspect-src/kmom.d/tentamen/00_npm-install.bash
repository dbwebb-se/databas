#!/usr/bin/env bash
cd me/tentamen || exit 1

echo "npm install express ejs body-parser mysql promise-mysql"

echo "Doing a silent 'npm --quiet install'"
if [[ -f package.json ]]; then
    npm --quiet install > /dev/null 2>&1
fi
