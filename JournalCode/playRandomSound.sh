# Play random sound from a specified folder

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sound_clips=()

mydir=${1:-}

get_array() {
    # Makes a string with line breaks after each filename
	mylist=$(ls -1 $mydir)
	
	# Turn the string into an array
	LFS=' '
	readarray sound_clips <<<"$mylist"
    
    
}

choose_random_sound() {
    mycliploc=$mydir
    mycliploc+="/"
    len=${#sound_clips[@]}
    randnum=$(($RANDOM%len))
    mycliploc+=${sound_clips[randnum]}
    play -q $mycliploc
}

# Check to see if a directory was specified at command line
if [ -d $mydir ]; then
	get_array
	choose_random_sound
else
	printf $mydir" is not a directory."
	exit
fi

