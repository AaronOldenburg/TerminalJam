# Play random sound from a specified folder

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sound_clips=()

mydir=${1:-}

get_array() {
    # Makes a string with line breaks after each filename
	mylist=$(ls $mydir)
	
	# Turn the string into an array
	read sound_clips <<< "$mylist"
	printf $sound_clips
    
    mycliploc=$mydir
    mycliploc+="/"
    mycliploc+=${sound_clips[0]}
    #play -q $mycliploc
    
}

choose_random_sound() {
	printf "\nChoosing...\n"
}

# Check to see if a directory was specified at command line
if [ -d $mydir ]; then
	get_array
	choose_random_sound
else
	printf $mydir" is not a directory."
	exit
fi

