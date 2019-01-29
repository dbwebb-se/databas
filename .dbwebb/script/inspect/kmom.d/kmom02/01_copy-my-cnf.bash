#!/usr/bin/env bash

# This should go into the docker container
cp "$COURSE_REPO/example/sql/inspect/my.cnf" "$HOME/.my.cnf"
chmod 600 "$HOME/.my.cnf"
