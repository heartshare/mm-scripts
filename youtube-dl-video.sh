#!/bin/bash
# Usage: ytmusic URL tag [EXTRA]


# Check if arguments are provided
if [ -z "$1" -o -z "$2" ]
then
    echo "Please provide arguments."
    exit 1
else
    # Initialize main parameters 
    url="$1"
    root="$HOME""/Videos/youtube/""$2"
    archive="$HOME""/Videos/youtube/.archive"
    if [ ! -d "$root" ]
    then
        mkdir "$root"
    fi
fi


# Set up initial parameters
# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"


# Limit bandwith
sudo wondershaper eth0 1500 100

# Main script wrapper
youtube-dl \
    --output "$root""/%(title)s---%(id)s.%(ext)s" \
    --download-archive "$archive" \
    --restrict-filenames \
    --write-description \
    --ignore-errors \
    $3 "$url"

# Unlimit bandwith
sudo wondershaper clear eth0

# Move description
mv $root/*.description /home/mama/Videos/youtube/descriptions/.
