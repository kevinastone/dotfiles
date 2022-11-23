#!/usr/bin/env bash

###############################################################################
# Time Machine
###############################################################################

for item in "~kstone/Downloads" "~kstone/Dropbox" "~kstone/Documents/Virtualbox VMs" "~kstone/.local" "~kstone/Movies" "~kstone/Applications"; do
    tmutil isexcluded "$item" || tmutil addexclusion -p "$item"
done
