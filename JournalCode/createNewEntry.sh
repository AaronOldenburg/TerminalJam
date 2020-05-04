# Look for a file with today's date in it
# If it doesn't exist, create it with a prompt

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

checkInterval=3600 # seconds
nameOfFile=""

new_file_name() {
    DATE=`date +%c`
    nameOfFile="../Journal/"$DATE".txt"
}

check_file_exists() {
    if [[ -f $nameOfFile ]]; then
        exit
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
            "Pick a location in your body. Describe in detail how it feels."
            "What do you care about?"
            "How are you taking care of yourself?"
            "What sounds do you hear?"
            )
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

do_steps() {
    new_file_name
    check_file_exists
    create_file
}

endless_loop() {
    while true
    do
        do_steps
        sleep $checkInterval
    done
}


# do one time
do_steps
# or comment the above out and uncomment the below for this
# program to run in the background:
# endless_loop



