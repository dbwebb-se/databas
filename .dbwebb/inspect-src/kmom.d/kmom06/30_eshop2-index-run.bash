#!/usr/bin/env bash
cd me/kmom06/eshop2 || exit

# Quit if file is missing
file="index.js"
[[ ! -f $file ]] && echo "File '$file' is missing!" && exit 1

# Kill process, before starting a new
pid=$( lsof -n -i4TCP:1337 | grep LISTEN | awk '{ print $2 }' )
[[ $pid ]] && kill $pid && echo "Killed pid '$pid' on port 1337"

echo "Startar 'node index'..."
DBWEBB_PORT=1337 node index &
sleep 2
read -p "Press enter to continue..."
