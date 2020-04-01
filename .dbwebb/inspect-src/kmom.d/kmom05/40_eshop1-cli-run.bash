#!/usr/bin/env bash
cd me/kmom05/eshop1 || exit
e() { exit; }; export -f e

# Quit if file is missing
file="cli.js"
[[ ! -f $file ]] && echo "File '$file' is missing!" && exit 1

echo "Startar 'node cli'..."
node cli
