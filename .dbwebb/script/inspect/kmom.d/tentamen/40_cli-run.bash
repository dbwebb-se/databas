#!/usr/bin/env bash
cd me/tentamen || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu                - Visa en meny
exit                - Avsluta
logg                - VVisa innehåll i joinad tabell
search <str>        - Sök i loggen

'search ps' visar två rader.
'search 1' visar en rad.
"

node cli.js
