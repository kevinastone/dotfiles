#!/bin/bash

SCRIPT_NAME=$(basename ${BASH_SOURCE})

OS_EXTENSION=""
OS_NAME=`uname -s`
if [[ $OS_NAME == "Darwin" ]]
then
	OS_EXTENSION=".osx"
elif [[ $OS_NAME == "Linux" ]]
then
	OS_EXTENSION=".linux"
fi

pushd $(dirname ${BASH_SOURCE}) >/dev/null
SRC_DIR=`pwd -P`

for fn in `ls`
do
	if [ $fn == $SCRIPT_NAME ]; then
		continue
	fi
	
	SRC_FILE="$SRC_DIR/$fn"
	DEST_FILE="$HOME/.${fn%$OS_EXTENSION}"
	
	if [ -L $DEST_FILE ] && [ $(readlink $DEST_FILE) = $SRC_FILE ]
	then
		echo "${DEST_FILE} already installed"
	else
		while true; do
			read -p "Install ${DEST_FILE}? (y/n/d)" yn
			case $yn in
				[Yy]* ) 
					echo "Installing $DEST_FILE"
					ln -sf $SRC_FILE $DEST_FILE
					break
					;;
				[Nn]* )
					break
					;;
				[Dd]* )
					diff -u $DEST_FILE $SRC_FILE
					;;
				* )
					echo "Please answer yes, no or diff."
					;;
			esac
		done
	fi
done
popd >/dev/null
