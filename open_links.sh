#!/bin/bash
#
## Check if Firefox is installed
if ! [ -x "$(command -v firefox)" ]; then
 echo "Error: Firefox is not installed. Please install Firefox and try again."
 exit 1
fi

# Prompt user for file name
read -p "Enter the name of the file: " file

# Check if file exists
if [ ! -f "$file" ]; then
 echo "Error: File does not exist. Please enter a valid file name."
 exit 1
fi

# Find URLs in file and store them in an array
urls=($(grep -o 'http[s]\?://[^"]*' "$file" | sort -u))

# Open each URL in a new Firefox tab
for url in "${urls[@]}"; do
  firefox --new-tab "$url" &
done

echo "All URLs have been opened in Firefox tabs."

