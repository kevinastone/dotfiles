#!/bin/bash

# shellcheck disable=SC2162,SC2164

SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"

OS_EXTENSION=""
OS_NAME=$(uname -s)
if [[ $OS_NAME == "Darwin" ]]
then
	OS_EXTENSION=".osx"
elif [[ $OS_NAME == "Linux" ]]
then
	OS_EXTENSION=".linux"
fi

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
SRC_DIR=$(pwd -P)

filenames=()
while IFS= read -r line; do filenames+=("$line"); done < <(find -L -- * -not -name '.*' -type f -print)

for fn in "${filenames[@]}"
do
	if [ "$fn" == "$SCRIPT_NAME" ]; then
		continue
	fi

	if echo "$fn" | grep -xq -f "${SRC_DIR}"/.skip-install; then
		continue
	fi

	PREFIX="."
	if [[ "$fn" == *.nodot ]]; then
		PREFIX=""
	fi
	SRC_FILE="$SRC_DIR/$fn"
	DEST_FN=${fn%$OS_EXTENSION}
	DEST_FN=${DEST_FN%%".nodot"}
	DEST_DIR=$(dirname ${DEST_FN})


	if [ "$DEST_DIR" == "." ]; then
		DEST_FILE="$HOME/${PREFIX}${DEST_FN}"
	else
		mkdir -p "$HOME/${PREFIX}${DEST_DIR}"
		DEST_FILE="$HOME/${PREFIX}${DEST_DIR}/$(basename ${DEST_FN})"
	fi

	if [ -L "$DEST_FILE" ] && [ "$(readlink "$DEST_FILE")" = "$SRC_FILE" ]
	then
		echo "${DEST_FILE} already installed"
	else
		while true; do
			read -p "Install ${DEST_FILE}? (y/n/c/d)" yn
			echo "${yn}"
			case $yn in
				[Yy]* ) 
					echo "Installing $DEST_FILE"
					ln -sf "$SRC_FILE" "$DEST_FILE"
					break
					;;
				[Nn]* )
					break
					;;
				[Cc]* )
					echo "Copying to $DEST_FILE"
					cp -i "$SRC_FILE" "$DEST_FILE"
					break
					;;
				[Dd]* )
					diff -u "$DEST_FILE" "$SRC_FILE"
					;;
				* )
					echo "Please answer yes, no, copy or diff."
					;;
			esac
		done
	fi
done
popd >/dev/null
