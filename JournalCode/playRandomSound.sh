# Play random sound from a specified folder

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sound_clips=()

mydir=${1:-}

get_array() {
    mylist=$(ls -1 ../Audio)
    printf "\n$mylist\nOK...\n"
    
    while read line; do
        read -ra myline <<< "$line"
        printf "\n$line\n"
    done < $mylist
    #sound_clips=$( ls -1 $mydir )
    #newstring=$mydir
    #newstring+="/"
    #newstring+=${sound_clips[0]}
    #echo $newstring
    #play $newstring
}

choose_random_sound() {
    printf "Choosing..."
}

# Check to see if a directory was specified at command line
if [ -d $mydir ]; then
    get_array
else
    printf $mydir" is not a directory."
    exit
fi

