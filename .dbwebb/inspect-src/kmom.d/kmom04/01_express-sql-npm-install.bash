#!/usr/bin/env bash
cd me/kmom04/express-sql || exit 1
echo "Doing a silent 'npm --quiet install'"
if [[ -f package.json ]]; then
    npm --quiet install > /dev/null 2>&1
fi
