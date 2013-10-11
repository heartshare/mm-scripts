#!/bin/bash
# Requirements: at, wmctrl, shutdown
# Usage: close-firefox-and-shutdown-computer minutes

# List of commands to run
commands=/home/mama/opt/mm-scripts/close-firefox-and-shutdown-computer.txt

# Close Firefox and shutdown computer after $1 minutes
at -f "$commands" now + "$1" min

exit
