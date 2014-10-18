#!/bin/bash

awk '/^#/ {sub(/#.*/,"");getline;}1' Brewfile | sed '/^$/d' | while read line; do

    brew $line
done
