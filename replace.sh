#!/bin/bash
# Usage: replace PATTERN OUT IN [replace]



# Check if arguments are provided
if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
    echo "Please provide arguments."
    exit 1
else
    # Initialize main parameters 
    pattern="$1"
    out="$2"
    in="$3"
fi



# Set up inital parameters

# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"

# Log
printf "\n%s\n============================\n" "$(date)" 1>&2
if [ -z "$4" ]
then
    printf "=   S I M U L A T I O N    =\n============================\n" 1>&2
fi
printf "# Match files with \"%s\" pattern and replace \"%s\" with \"%s\" string inside files.\n" \
    "$pattern" "$out" "$in" 1>&2



# Do the work
for file in $(find . -iname "$pattern" -exec basename {} \;);
do
    printf "# %s\n" "$file" 1>&2
    printf "%s > %s\n" \
        "$(grep -o -n -e "$out" "$file")" \
        "$(grep -o -e "$out" "$file" | sed -e "s/$out/$in/")" 1>&2
    if [ ! -z "$4" ]
    then
        sed -i -e "s/$out/$in/" "$file"
    fi
done

exit 0
