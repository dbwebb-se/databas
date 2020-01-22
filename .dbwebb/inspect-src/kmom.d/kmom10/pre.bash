#!/usr/bin/env bash

printf ">>> -------------- Pre inspect -------------------------\n"

# Open localhost:1337 in browser
printf "Open localhost:1337/eshop/index in browser\n"
eval "$BROWSER" "http://127.0.0.1:1337/eshop/index" &

echo
