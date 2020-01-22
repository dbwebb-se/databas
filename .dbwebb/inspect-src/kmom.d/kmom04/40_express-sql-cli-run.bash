#!/usr/bin/env bash
cd me/kmom04/express-sql || exit

echo "
FÖLJANDE SKALL FUNGERA
----------------------
menu              - Visa en meny
move              - Flytta 1.5 peng från Adam till Eva
exit              - Avsluta
"

node cli.js
