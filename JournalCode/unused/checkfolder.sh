# Check folder for recent file changes

#!/bin/bash
set -eo pipefail # removed -u because of issue with $newFile
IFS=$'\n\t'

# Load on start from mystartup.sh

checkInterval=60 # seconds
let minInterval="checkInterval/60"
newFile=""

# Can specify a different folder from command line
myfolder=${1:-}
if [[ -z "$myfolder" ]]; then
	myfolder='../Journal'
fi

#echo "Checking $myfolder for revisions"

# Location of folder is passed as parameter
# Run in the background
# killall sh to totally end
while true
do
	# Check myfolder to see if anything new added in recent minutes
	# `sed` removes the result that is just the folder
	newFile=( $(find $myfolder -mmin -$minInterval | sed 's/^\.\///') )
	if [[ -z "$newFile" ]]; then
		#printf "No new file found.\n"
	else 
		#printf "New files are:\n"
		for i in "${newFile[@]}"; do
			echo $i
			sh getRandomWord.sh $i &
		done
	fi
	sleep $checkInterval
done
