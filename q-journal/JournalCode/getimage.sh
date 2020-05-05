# Find an image based on a random word

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

myword=${1:-}
if [ -z "$myword" ]; then
	printf "No file specified.\n"
	exit
fi

#printf "\n\n getimage.sh has received the word: $myword\n\n"

xdg-open "http://duckduckgo.com/${myword}?iax=images&ia=images"
