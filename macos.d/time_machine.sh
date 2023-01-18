#!/usr/bin/env bash

###############################################################################
# Time Machine
###############################################################################

for item in "~kstone/Downloads" "~kstone/Library/CloudStorage/Dropbox" "~kstone/Documents/Virtualbox VMs" "~kstone/.local" "~kstone/Movies" "~kstone/Applications"; do
    tmutil isexcluded "$item" | grep '[Excluded]' || sudo tmutil addexclusion -p "$item"
done
