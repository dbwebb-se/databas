#!/usr/bin/env bash

set -e

target="skolan"

mysql -udbwebb skolan < example/sql/inspect/setup_$target.sql
