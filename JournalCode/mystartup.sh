# Startup loaded from /etc/profile

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

clear
echo "q-journal by Aaron Oldenburg\n\n"
sleep 5
clear

# Add & at the end to run in background
#sh checkfolder.sh &
sh createNewEntry.sh
