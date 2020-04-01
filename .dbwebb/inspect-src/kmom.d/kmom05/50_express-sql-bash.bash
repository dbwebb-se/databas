#!/usr/bin/env bash
cd me/kmom05/eshop1 || exit
e() { exit; }; export -f e

echo "Do manual stuff, if needed (write exit to exit)?"
ls
bash
