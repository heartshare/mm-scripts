#!/bin/bash
# Usage: replace FIND-PATTERN GREP-PATTERN OUT IN [replace]



# Check if arguments are provided
if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
    echo "Please provide arguments."
    exit 1
else
    # Initialize main parameters 
    findpattern="$1"
    greppattern="$2"
    out="$3"
    in="$4"
    if [ -z "$5" ]
    then
        simulation="Yes"
    else
        simulation="No"
    fi
fi



# Set up inital parameters

# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS="$(printf '\n\t')"

# Log
printf "\n%s\n============================\n" "$(date)" 1>&2
if [ "$simulation" == "Yes" ]
then
    printf "=   S I M U L A T I O N    =\n============================\n" 1>&2
fi
printf "# Match files with \"%s\" findpattern and replace \"%s\" with \"%s\" string inside files.\n" \
    "$findpattern" "$out" "$in" 1>&2



# Do the work
for file in $(find . -iname "$findpattern" -exec basename {} \;);
do
    if [ "$greppattern" == "false" ]
    then
        # Log
        printf "%s > %s # %s\n" \
            "$(grep -o -n -e "$out" "$file")" \
            "$(grep -o -e "$out" "$file" | sed -e "s/$out/$in/")" \
            "$file" 1>&2

        # Replace
        if [ "$simulation" == "No" ]
        then
            sed -i -e "s/$out/$in/" "$file"
        fi
    elif grep -q -s -i -e "$greppattern" "$file"
    then
        # Log
        printf "%s > %s # %s\n" \
            "$(grep -o -n -e "$out" "$file")" \
            "$(grep -o -e "$out" "$file" | sed -e "s/$out/$in/")" \
            "$file" 1>&2

        # Replace
        if [ "$simulation" == "No" ]
        then
            sed -i -e "s/$out/$in/" "$file"
        fi
    fi
done

exit 0
