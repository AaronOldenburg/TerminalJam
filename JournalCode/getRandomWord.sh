# Grab a random word from array

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

#myArray=${1:-}
myArray=("$@")
#myArray=${@:-}
#set -A myArray $1
printf "\nTest:\n${myArray[0]}"
if [ -z "$myArray" ]; then
	printf "No array specified.\n"
	exit
fi

printf "\n\nChoosing random word.\n\n"

# Get array length
len=${#myArray[@]}

# Get a random number between 0 & len
randnum=$(($RANDOM%len))

printf "\nMy random word: ${myArray[randnum]}\n"
