# Startup loaded from /etc/profile

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

waitInterval=30

sleep $waitInterval

echo "Beginning my scripts."

# For now hold off, since can't see the results
sh checkfolder.sh &
sh createNewEntry.sh &
