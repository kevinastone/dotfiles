#!/usr/bin/env bash

set -ex

###############################################################################
# Kap
###############################################################################

pushd "${BASH_SOURCE%/*}/Services" &>/dev/null
    for workflow in *.workflow; do
        ln -sf "$PWD"/"$workflow" $HOME/Library/Services/"$workflow"
    done
popd &>/dev/null

# defaults read pbs NSServicesStatus
# "NSServicesStatus" => {
#   "(null) - Open in Chrome - runWorkflowAsService" => {
#     "key_equivalent" => "@$o"
#     "presentation_modes" => {
#       "ContextMenu" => 1
#       "ServicesMenu" => 1
#       "TouchBar" => 1
#     }
#   }
# }
