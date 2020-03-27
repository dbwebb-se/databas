#!/usr/bin/env bash
set -e

cd me/tentamen || exit

[[ ! -f doc/er.pdf ]] && find . -name '[eE][rR].*'
[[ -f doc/er.pdf ]]
