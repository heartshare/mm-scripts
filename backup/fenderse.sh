#!/bin/bash
# Usage: backup-fendersen-com-original

dir="$HOME""/backup/web/original"
useragent="Mozilla/5.0 (compatible; Wget; https://github.com/IFINSITURCON)"
log="$HOME""/backup/web/logs/www.fendersen.com-original.log"
url="http://72.52.202.216/~fenderse/"

cd "$dir"

wget \
    --user-agent="$useragent" \
    --output-file="$log" \
    --convert-links --backup-converted \
    --recursive --level=inf \
    --limit-rate=333k \
    --page-requisites \
    --timestamping \
    --background \
    "$url"
