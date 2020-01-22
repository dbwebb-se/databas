#!/usr/bin/env bash
cd me/kmom10/eshop3 || exit

echo "
FÖLJANDE SKALL FUNGERA via localhost:1337
----------------------
eshop/index        - Välkomstsida, gemensam header footer och navigering
eshop/about        - Namn på de som jobbat i gruppen
eshop/customer     - Visa kunder
eshop/order        - Översikt av ordrar

CRUD för att skapa order, orderrader och beställa order.

Tydligt visa att orderns status ändras.
 
(servern startas i bakgrunden och dödas senare)
(var med på att utskrift från servern krockar med annan utskrift)
"

# Kill process, before starting a new
pid=$( lsof -n -i4TCP:1337 | grep LISTEN | awk '{ print $2 }' )
[[ $pid ]] && kill $pid && echo "Killed pid '$pid' on port 1337"

DBWEBB_PORT=1337 node index.js &
sleep 2
read -p "Press enter to continue..."
