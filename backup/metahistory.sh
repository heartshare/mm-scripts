#!/bin/bash
# Usage: backup-metahistory-original

dir="$HOME""/backup/web/original"
useragent="Mozilla/5.0 (compatible; Wget; https://github.com/metahistory)"
log="$HOME""/backup/web/logs/www.metahistory.org-original.log"
url="http://www.metahistory.org/"

cd "$dir"

wget \
    --user-agent="$useragent" \
    --output-file="$log" \
    --recursive --level=inf \
    --limit-rate=150k \
    --page-requisites \
    --timestamping \
    --background \
    "$url"
