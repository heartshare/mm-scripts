#!/bin/bash
# Requirements: vlc
# Usage: vlc-global-keys-on

# Run VLC with specific global keys on
vlc \
  --global-key-play-pause 4 \
  --global-key-jump-extrashort 2 \
  --global-key-jump+extrashort 3 \
  --global-key-jump-short 8 \
  --global-key-jump+short 9
