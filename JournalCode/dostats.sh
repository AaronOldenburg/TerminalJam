# Output game stats

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

filename="../stats.txt"
DATE=`date +%c`
health=100

printf "Checking file...\n\n"

update_file() {
    printf "\n\nOn "$DATE", " >> $filename
    
    printf "you lost 20 health.\n" >> $filename
    
    health=$((health-20))
    
    if [ $health -gt 0 ]; then
        printf "You are alive.\n" >> $filename
    else
        printf "You are dead.\n" >> $filename
    fi
    printf "Health now is:\n" >> $filename
    printf $health >> $filename
}

if [[ -f $filename ]]; then
    printf "Old file\n"
    health=$(tail -n 1 $filename)
    update_file
else
    printf "New file\n"
    defaultText="For those of you who feel this isn't enough of a game:\n\n"
    printf $defaultText > $filename
    update_file
fi

