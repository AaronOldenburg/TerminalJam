# Look for a file with today's date in it
# If it doesn't exist, create it with a prompt

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DATE=`date +%Y-%m-%d`
nameOfFile="../Journal/"$DATE".txt"

printf "Looking to see if today's entry already exists.\n\n"

if [[ -f $nameOfFile ]]; then
    printf $nameOfFile" exists already.\n\n"
    exit
fi

printf "It doesn't exist. Creating it.\n\n"


# Create random prompt
# Load from json file

prompts=("What did you notice today?"
        "What do you see outside your window?"
        "Describe a forest."
        "Where are you?")
len=${#prompts[@]}
rand=$(($RANDOM%$len))
todayPrompt=${prompts[rand]}
day=$(date +%A)
month=$(date +%B)
date=$(date +%d)
year=$(date +%Y)
time=$(date +"%r")

printf $day", "$month" "$date", "$year"\n"$time"\n\n" > $nameOfFile
printf $todayPrompt"\n\n" >> $nameOfFile

# adding +num after nano puts the cursor at that line
# or whatever last line is
nano +666 $nameOfFile
