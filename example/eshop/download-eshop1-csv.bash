#!/usr/bin/env bash

url="https://docs.google.com/spreadsheets/d/1yz0-C1SFYvNw_mN5CrZd9QrjKUXqKv3OhSlGUci8Mls/gviz/tq?tqx=out:csv&sheet"

for target in kund produkt kategori produkt2kategori lager produkt2lager; do
    printf "%s\n" "$target"
    curl --silent "$url=$target" > "$target.csv"
done

ls -l -- *.csv
file -- *.csv
