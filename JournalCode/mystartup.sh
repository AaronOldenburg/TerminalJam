# Startup loaded from /etc/profile

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Wait..."

waitInterval=30

sleep $waitInterval

echo "Beginning my scripts."

# Add & at the end to run in background
sh checkfolder.sh &
sh createNewEntry.sh
