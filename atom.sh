#!/bin/sh

cd ${HOME}
[ -d ${HOME}/.atom ] || git clone git@bitbucket.org:kevinastone/.atom.git
apm install --starred
