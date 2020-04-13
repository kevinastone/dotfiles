#!/bin/bash

function first() {
    files=("$@")
    for file in ${files[@]}
    do
        echo "$file"
        return
    done
}
