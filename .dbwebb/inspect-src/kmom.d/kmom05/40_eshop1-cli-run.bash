#!/usr/bin/env bash
cd me/kmom05/eshop1 || exit
e() { exit; }
export -f e

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu              - Visa en meny
log <number>      - Visa visst antal senaste rader i loggtabellen
shelf             - Översikt av lagrets alla hyllor
inventory         - Visa vilka produkter som finns i lagret
inventory <str>   - Filtrera utskriften
invadd <productid> <shelf> <number> - Lägg ett antal av produkterna på en hylla i lagret.
invdel <productid> <shelf> <number> - Plocka bort ett antal av produkterna på en hylla i lagret.
exit              - Avsluta
"

node cli.js
