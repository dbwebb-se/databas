#!/usr/bin/env bash
cd me || exit 1
echo "Doing a silent 'npm --quiet install'"
npm install --quiet
