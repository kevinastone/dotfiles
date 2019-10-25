#!/usr/bin/env bash

###############################################################################
# Workflows
###############################################################################

pushd "${BASH_SOURCE%/*}/Services" &>/dev/null
    for workflow in *.workflow; do
        ln -shf "$PWD"/"$workflow" $HOME/Library/Services/"$workflow"
    done
popd &>/dev/null
