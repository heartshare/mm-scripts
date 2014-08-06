#!/bin/bash
# Usage: backup-taiji-yanta-net-original

dir="$HOME""/backup/web/original"
useragent="Mozilla/5.0 (compatible; Wget; https://github.com/taijiquan)"
log="$HOME""/backup/web/logs/taiji.yanta.net-original.log"
url="http://taiji.yanta.net/"

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
