#!/bin/bash

SCRIPT_NAME=$(basename ${BASH_SOURCE})

pushd $(dirname ${BASH_SOURCE}) >/dev/null
SRC_DIR=`pwd -P`

for fn in `ls`
do
	if [ $fn == $SCRIPT_NAME ]; then
		continue
	fi
	
	SRC_FILE="$SRC_DIR/$fn"
	DEST_FILE="$HOME/.${fn%.osx}"
	
	if [ -L $DEST_FILE ] && [ $(readlink $DEST_FILE) = $SRC_FILE ]
	then
		echo "${DEST_FILE} already installed"
	else
		read -p "Install ${DEST_FILE}? (y/n)" -r
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			echo "Installing $DEST_FILE"
			ln -sf $SRC_FILE $DEST_FILE
		fi
	fi
done
popd >/dev/null
