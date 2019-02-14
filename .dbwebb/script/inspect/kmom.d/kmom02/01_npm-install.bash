#!/usr/bin/env bash
cd me/kmom02/terminal1 || exit 1
if [[ -f package.json ]]; then
    npm install
fi
