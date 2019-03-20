#!/usr/bin/env bash

printf ">>> -------------- Pre inspect -------------------------\n"

# Open localhost:1337 in browser
printf "Open localhost:1337/bank/index in browser\n"
eval "$BROWSER" "http://127.0.0.1:1337/bank/index" &

# Open er.pdf in browser
printf "Open me/kmom04/er2/er.pdf in browser\n"
eval "$BROWSER" "me/kmom04/er2/er.pdf" &

echo
