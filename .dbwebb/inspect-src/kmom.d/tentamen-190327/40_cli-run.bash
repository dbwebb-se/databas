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
'search 5' visar tre rader.
"

node cli.js
