#!/bin/bash

set -x
shopt -s nullglob

for src in "$@"
do
    fn=$(basename "$src")
    xdelta3 -d -s "$fn" "$src" "$fn.tmp" && mv "$fn.tmp" "$fn"
done
