#!/usr/bin/env bash
cd me/kmom04/express-sql || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu              - Visa en meny
balance           - Visa balansen på kontona
move              - Flytta 1.5 peng från Adam till Eva
exit              - Avsluta
"

node cli.js
