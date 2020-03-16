#!/usr/bin/env bash
cd me/tentamen || exit 1

echo "Expecting something like this:"
echo " npm install express ejs body-parser mysql promise-mysql\n"

echo "Doing a silent 'npm --quiet install'"
if [[ -f package.json ]]; then
    npm --quiet install > /dev/null 2>&1
fi
