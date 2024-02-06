#!/usr/bin/env bash -i
#
# Script run for specific kmom (within docker).
#
# Available (and usable) data:
#   $KMOM
#   $ACRONYM
#   $COURSE_REPO
#
#echo $-
#export TERM="xterm"
#export PS1="$ "
#shopt -s checkwinsize
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#source $HOME/.bashrc


cd me || exit
e() { exit; }
export -f e

echo "[$ACRONYM] Do manual stuff, if needed (write e/exit to exit)?"
ls -l skolan
bash
