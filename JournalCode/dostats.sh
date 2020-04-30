# Output game stats

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

filename="../stats.txt"
DATE=`date +%c`
health=100
MAX_HIT=50

printf "Checking file...\n\n"

update_file() {
    range_double=$(( MAX_HIT*2 ))
    hit_amt=$(( $((RANDOM%range_double))-MAX_HIT ))
    printf "\n"$hit_amt"\n"

    printf "\n\nOn "$DATE", " >> $filename
    
    if [ $hit_amt -gt 0 ]; then
        printf "you gained "$hit_amt" health.\n" >> $filename
    elif [ $hit_amt -lt 0 ]; then
        printf "you lost "$hit_amt" health.\n" >> $filename
    else
        printf "your health stayed the same.\n" >> $filename
    fi
        
    health=$((health+hit_amt))
    
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
    defaultText="Your game stats.\n\n"
    printf $defaultText > $filename
    update_file
fi

