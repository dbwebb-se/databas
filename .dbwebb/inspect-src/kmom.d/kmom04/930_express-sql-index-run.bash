#!/usr/bin/env bash
cd me/kmom04/express-sql || exit

echo "
FÖLJANDE SKALL FUNGERA via localhost:1337
----------------------
bank/index        - Översikt, gemensam header footer och navigering
bank/balance      - Visa tabell med nuvarande kontoställningar
bank/move-to-adam - Flytta 1.5 peng från Eva till Adam
"

# Kill process, before starting a new
pid=$( lsof -n -i4TCP:1337 | grep LISTEN | awk '{ print $2 }' )
[[ $pid ]] && kill $pid && echo "Killed pid '$pid' on port 1337"

DBWEBB_PORT=1337 node index.js &
sleep 2
read -p "Press enter to continue..."
