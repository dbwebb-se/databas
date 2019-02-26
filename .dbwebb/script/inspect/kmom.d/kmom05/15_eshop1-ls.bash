#!/usr/bin/env bash
cd me/kmom05/eshop1 || exit

tree -p -I 'node_modules|vendor' .
