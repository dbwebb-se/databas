#!/usr/bin/env bash

cd me/tentamen || exit

tree -p -I 'node_modules|vendor' -L 1 .

tree -p sql

tree -p src
