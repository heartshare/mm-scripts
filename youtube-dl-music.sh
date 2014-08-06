#!/bin/bash
# Usage: ytmusic tag [OPTIONS] URL


# Check if arguments are provided
if [ -z "$1" -o -z "$2" ]
then
    echo "Please provide arguments."
    exit 1
else
    # Initialize main parameters 
    root="$HOME""/Music/youtube/""$1"
    shift
    archive="$HOME""/Music/youtube/.archive"
    if [ ! -d "$root" ]
    then
        mkdir "$root"
    fi
fi


# Set up initial parameters
# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"


# Main script wrapper
youtube-dl-old \
    --output "$root""/%(title)s---%(id)s.%(ext)s" \
    --download-archive "$archive" \
    --restrict-filenames \
    --write-description \
    --ignore-errors \
    --extract-audio \
    "$@"

# Move description
mv $root/*.description /home/mama/Music/youtube/descriptions/.
