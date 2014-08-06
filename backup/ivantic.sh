#!/bin/bash
# Usage: backup-ivantic-original

dir="$HOME""/backup/web/original"
useragent="Mozilla/5.0 (compatible;)"
log="$HOME""/backup/web/logs/www.ivantic.net-original.log"
url="http://www.ivantic.net/"

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
