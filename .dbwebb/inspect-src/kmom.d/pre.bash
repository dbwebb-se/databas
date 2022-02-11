#!/usr/bin/env bash
#
# Script run BEFORE kmom specific scripts.
# Put tests here that applies to all kmoms.
#
# Available (and usable) data:
#   $COURSE
#   $KMOM
#   $ACRONYM
#   $REDOVISA_HTTP_PREFIX
#   $REDOVISA_HTTP_POSTFIX
#   eval "$BROWSER" "$url" &
#
#printf ">>> -------------- Pre (all kmoms) ----------------------\n"

# Open log
echo "[$ACRONYM/$COURSE/$KMOM]" > "$LOG_DOCKER"

# # Open localhost:1337 in browser
# printf "Open localhost:1337/eshop/index in browser\n"
# eval "$BROWSER" "http://127.0.0.1:1337/eshop/index" &

# Open me/kmom01/redovisa
url="$REDOVISA_HTTP_PREFIX/~$ACRONYM/dbwebb-kurser/$COURSE/$REDOVISA_HTTP_POSTFIX"
#printf "$url\n" 2>&1
#eval "$BROWSER" "$url" &
openUrl "$url"

case $KMOM in
    kmom03)
        openUrl "file://$( pwd )/me/kmom03/er1/er.pdf"
    ;;
    kmom04)
        openUrl "file://$( pwd )/me/kmom04/er2/er.pdf"
        openUrl "http://127.0.0.1:1337/bank/index"
    ;;
esac
