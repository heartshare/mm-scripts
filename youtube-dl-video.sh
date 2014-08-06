#!/bin/bash
# Usage: ytvideo tag [OPTIONS] URL


# Check if arguments are provided
if [ -z "$1" -o -z "$2" ]
then
    echo "Please provide arguments."
    exit 1
else
    # Initialize main parameters 
    root="$HOME""/Videos/youtube/""$1"
    shift
    archive="$HOME""/Videos/youtube/.archive"
    if [ ! -d "$root" ]
    then
        mkdir "$root"
    fi
fi


# Set up initial parameters
# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"


# Main script wrapper
youtube-dl \
    --output "$root""/%(title)s---%(id)s.%(ext)s" \
    --download-archive "$archive" \
    --restrict-filenames \
    --write-description \
    --ignore-errors \
    "$@"

# Move description
mv $root/*.description /home/mama/Videos/youtube/descriptions/.
