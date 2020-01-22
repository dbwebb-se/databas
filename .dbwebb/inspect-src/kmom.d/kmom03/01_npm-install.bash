#!/usr/bin/env bash
cd me/kmom03/terminal2 || exit 1
if [[ -f package.json ]]; then
    npm install
fi
