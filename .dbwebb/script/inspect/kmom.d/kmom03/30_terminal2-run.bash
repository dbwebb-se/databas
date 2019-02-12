#!/usr/bin/env bash
cd me/kmom03/terminal2 || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu              - Visa en meny
larare            - Visa detaljer om lärare inkl ålder
kompetens         - Visa hur kompetensen ändrats i lönerevisionen
lon               - Visa hur lånen ändrats i senaste lönerevisionen
sok <str>         - Visa lärare som matchar <str>
nylon <akr> <lon> - Sätt ny lön hos lärare
exit              - Avsluta
"
node index.js
