# Look for a file with today's date in it
# If it doesn't exist, create it with a prompt

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

checkInterval=3600 # seconds
nameOfFile=""

new_file_name() {
    DATE=`date +%Y-%m-%d`
    nameOfFile="../Journal/"$DATE".txt"
}

check_file_exists() {
    printf "Looking to see if today's entry already exists.\n\n"
    if [[ -f $nameOfFile ]]; then
        printf $nameOfFile" exists already.\n\n"
        exit
    else
        printf "It doesn't exist. Creating it.\n\n"
    fi
}

get_random_prompt() {
    prompts=("What did you notice today?"
            "What do you see outside your window?"
            "Describe a forest."
            "Where are you?"
            "Who or what has passed through your home recently?"
            "What have you dreamed about, or are you dreaming about?"
            "What does the air feel like?"
            "Describe a meal."
            "Pick a location in your body Describe in detail how it feels.")
    len=${#prompts[@]}
    rand=$(($RANDOM%$len))
    prompt=${prompts[rand]}
    echo $prompt
}

create_file() {
    todayPrompt=$(get_random_prompt)

    day=$(date +%A)
    month=$(date +%B)
    date=$(date +%d)
    year=$(date +%Y)
    time=$(date +"%r")

    printf $day", "$month" "$date", "$year"\n"$time"\n\n" > $nameOfFile
    printf $todayPrompt"\n\n" >> $nameOfFile

        
    # adding +num after nano puts the cursor at that line
    # or whatever last line is
    nano --softwrap +666 $nameOfFile
}

while true
do
    new_file_name
    check_file_exists
    create_file
    sleep $checkInterval
done




