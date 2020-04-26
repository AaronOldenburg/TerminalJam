# Turn file into array of words

#!/bin/bash
set -euo pipefail
IFS=$'\n\t' # changed below...

# Check to see if a file was specified at command line
myfile=${1:-}
if [ -z "$myfile" ]; then
	printf "No file specified.\n"
	exit
elif [ -d "$myfile" ]; then
	printf "$myfile is a directory.\n"
	exit
fi

echo "Seaching $myfile."

# IFS is Internal Field Separator, decides what separates info into array
IFS=" "

printf "\nConverting text file to word array...\n\n"

# Initialize $mywords array
mywords=()

# Read $myfile line by line
while read line; do
	# -ra, `a` for array, `r` is raw input, 
	# disabling interpretation of backslash commands
	read -ra myline <<< "$line"
	if [[ ${mywords[@]} ]]; then
		# Add $line array to $mywords array
		mywords+=( $line )
	else
		mywords=( $line )
	fi
done < $myfile

printf "\n\nWords:\n\n"
for word in "${mywords[@]}"; do
	printf "A word: $word\n"
done
printf "\n\nThat's all the words.\n\n"

# Send array to script that chooses random word

sh getRandomWord.sh "${mywords[*]}"
