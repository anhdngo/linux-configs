#!/bin/bash

TODAY=$VIMWIKI/diary/$(date +'%Y-%m-%d').md
if [[ ! -f $TODAY ]]; then
    echo "File $TODAY does not exist, creating..."
    vim -c ":VimwikiMakeDiaryNote"
    exit 0
fi

echo To Do Today
cat $TODAY | grep "\* \[ \]"
