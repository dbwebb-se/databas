#!/usr/bin/env bash

gui-read-acronym()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --inputbox "Select acronym" \
        24 80 \
        "$1" \
        3>&1 1>&2 2>&3 3>&-
}

selected=$( gui-read-acronym "mega18" )
