# Startup loaded from /etc/profile

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

clear
echo "q-journal by Aaron Oldenburg"
sleep 5
clear

# Add & at the end to run in background
#sh checkfolder.sh &
sh playRandomSound.sh ../Audio &
sh createNewEntry.sh
#sh dostats.sh
