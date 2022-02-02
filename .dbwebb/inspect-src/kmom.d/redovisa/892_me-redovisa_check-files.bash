#!/usr/bin/env bash
. ".dbwebb/inspect-src/kmom.d/functions.bash"

TARGET_DIR="me/redovisa"
CHECK_FILES=""

cd $TARGET_DIR || exit 1

content=$( ls )
[[ ! -z $content ]]

doLog $? "$TARGET_DIR: check the directory exists"
