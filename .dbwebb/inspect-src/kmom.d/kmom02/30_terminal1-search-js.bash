#!/usr/bin/env bash
cd me/kmom02/terminal1 || exit

echo "[$ACRONYM] node search"
read -p "Press enter to continue..."

echo "'7' should give Dumbledore"
node search
echo "'al' should give ala, dum, min"
node search
