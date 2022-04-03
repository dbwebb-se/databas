#!/usr/bin/env bash
cd me/kmom06/eshop2 || exit

# Kill server
pid=$( lsof -n -i4TCP:1337 | grep LISTEN | awk '{ print $2 }' )
if [[ $pid ]]; then
    kill $pid
    echo "Killed pid '$pid' on port 1337"
fi
