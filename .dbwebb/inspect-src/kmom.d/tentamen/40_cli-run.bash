#!/usr/bin/env bash
cd me/tentamen || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu                - Visa en meny
exit                - Avsluta
report              - Visa innehåll i joinad tabell
search <str>        - Sök i rapporten

"

node cli.js
