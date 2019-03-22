#!/usr/bin/env bash
cd me/kmom10/eshop3 || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu                - Visa en meny
about               - Visa namnet på de i gruppen
order <search>      - Visa samtliga (eller matchande) ordrar
picklist <order_id> - Skapa en plocklista för en order
ship <order_id>     - Skeppa/skicka en order
exit                - Avsluta

ESHOP1
log <number>      - Visa visst antal senaste rader i loggtabellen
shelf             - Översikt av lagrets alla hyllor
inventory         - Visa vilka produkter som finns i lagret
inventory <str>   - Filtrera utskriften
invadd <productid> <shelf> <number> - Lägg ett antal av produkterna på en hylla i lagret.
invdel <productid> <shelf> <number> - Plocka bort ett antal av produkterna på en hylla i lagret.
"

node cli.js
