#!/usr/bin/env bash

###############################################################################
# Sudo
###############################################################################

pushd "${BASH_SOURCE%/*}" &>/dev/null
    diff -u /etc/pam.d/sudo sudo || {
        (umask 0333 && sudo cp -i sudo /etc/pam.d/sudo)
    }
    sudo cp htop /etc/sudoers.d/
popd &>/dev/null
