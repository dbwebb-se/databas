#!/usr/bin/env bash
cd me/kmom10/eshop3 || exit

# Quit if file is missing
file="cli.js"
[[ ! -f $file ]] && echo "File '$file' is missing!" && exit 1

node cli
