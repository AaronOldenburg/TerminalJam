This is a set of shell scripts that set up a journal entry, including an optional random prompt. 

## Instructions:

- Set 'start' as executable. Run it from your terminal.
- Write your entry. CTRL+X to save and exit.

## Optional modifications:

- Uses Nano to edit journal entries, but this can be changed in the 'create_file' function in 'createNewEntry.sh'
- I experimented with starting the journal entry with a random sound, choosing a word at random from the last journal entry and doing a web search for a photo of that word, and a pseudo-game stats tracker. These are all turned off, but you can turn them on easily in the 'mystartup.sh' script. The 'Audio' folder is empty, however, so you would have to add your own sounds.
- You can set it to ask you to create a new entry every so often. In 'createNewEntry.sh', set the 'checkInterval' to the number of seconds between checks and make the change explained in comments at the bottom of the file.
