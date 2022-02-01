#!/usr/bin/env bash
#
# Script run for specific kmom (within docker).
#
# Available (and usable) data:
#   $KMOM
#   $ACRONYM
#   $COURSE_REPO
#
cd me/kmom02/terminal1 || exit
e() { exit; }
export -f e

echo "[$ACRONYM] Do manual stuff, if needed (write e/exit to exit)?"
ls
bash
