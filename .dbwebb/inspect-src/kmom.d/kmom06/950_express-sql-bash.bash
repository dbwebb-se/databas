#!/usr/bin/env bash
cd me/kmom06/eshop2 || exit
e() { exit; }
export -f e

echo "Do manual stuff, if needed (write exit to exit)?"
ls
bash
