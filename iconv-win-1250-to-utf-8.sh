#!/bin/bash
# Requirements: sed, iconv
# Usage: iconv-win-1250-to-utf-8 input

# Temporary output file
out=/tmp/subtitle-utf-8.txt

# Change character encoding from WINDOWS-1250 to UTF-8
iconv -f WINDOWS-1250 -t UTF-8 -o "$out" "$1"

# Replace original subtitle file with temporary one
mv "$out" "$1"

exit
