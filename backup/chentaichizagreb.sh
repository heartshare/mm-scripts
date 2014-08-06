#!/bin/bash
# Usage: backup-chentaichizagreb-com-original

dir="$HOME""/backup/web/original/chentaichizagreb"
useragent="Mozilla/5.0 (compatible; Wget; https://github.com/taijiquan)"
log="$HOME""/backup/web/logs/chentaichizagreb.com-original.log"
url="http://chentaichizagreb.com/"

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
