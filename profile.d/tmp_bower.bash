#!/bin/bash

function tmp_bower() {

	CONFIG_FILE=".bowerrc"
	
	BASE_DIR=${TMPDIR:-/var/tmp}
	ORIG_DIR=$PWD
	HASH_CMD="md5sum"

	DIR_NAME=`echo $PWD | $HASH_CMD | cut -f1 -d " "`

	TMP_DIR=$BASE_DIR/$DIR_NAME
	mkdir -p $TMP_DIR

	pushd $TMP_DIR

	ln -sf $ORIG_DIR/bower.json
	ln -sf $ORIG_DIR/.bowerrc
	
	bower --allow-root $1
	
	ASSET_DIR=`python -mjson.tool ${CONFIG_FILE} | grep directory | sed -e 's/^ *//g' -e 's/ *$//g' | cut -f2 -d" "`
	# Remove comma
	ASSET_DIR=${ASSET_DIR%?}
	# Remove quotes
	ASSET_DIR=${ASSET_DIR#\"}
	ASSET_DIR=${ASSET_DIR%\"}

	echo $ASSET_DIR
	
	# Can't use archive mode cause of the permissions
	rsync --recursive --links --times --include=$ASSET_DIR --exclude="*" . $ORIG_DIR

	popd
}
