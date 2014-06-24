
function slup() {

	. ~/.secrets

	filename=${1-"-"}
	shift;
	
	options=""
	if [ "$filename" != "-" ]; then
		options="${options} -F 'filename=`basename ${filename}`'"
	fi

	for param in "$@"
	do
		options="${options} -F '${param}'"
	done

	cmd="curl -s -F file=@${filename} -F token=${SLACK_TOKEN} $options https://slack.com/api/files.upload"
	# echo $cmd
	response=`$cmd`
	# echo $response
	url=`echo $response | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["file"]["permalink"]'`
	hash pbcopy >/dev/null && echo $url | pbcopy
	echo $url
}
