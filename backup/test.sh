#!/bin/bash
# Usage: backup-test-original

dir="$HOME""/backup/web/original"
useragent="Mozilla/5.0 (compatible;)"
log="$HOME""/backup/web/logs/test.log"
url="http://dl.iskon.hr/igre/gnethr/"

cd "$dir"

wget \
    --user-agent="$useragent" \
    --output-file="$log" \
    --recursive --level=inf \
    --limit-rate=555k \
    --page-requisites \
    --timestamping \
    --background \
    --no-parent \
    "$url"
