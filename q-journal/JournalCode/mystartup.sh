# Startup loaded from /etc/profile

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

clear
echo "q-journal by Aaron Oldenburg"
sleep 5
clear

# `&` added at the end of certain scripts to run in background

# Checks for new file every ____ seconds (default: 300)
# Gets random word from new journal entry, searches the web for images
# Requires 'xdg-open' to be installed
#sh checkfolder.sh &

# Plays a random sound from Audio folder on start
# Requires 'sox' to be installed.
#sh playRandomSound.sh ../Audio &

# Main journal entry script
sh createNewEntry.sh

# Creates a faux game-like log
#sh dostats.sh
