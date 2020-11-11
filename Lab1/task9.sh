#!/bin/bash
#xargc wc -l : count lines, bytes, words
#iname : case sensitive
#type -f : type file
#readable : to search readable files only
#grep -v permission denied -> don't show this error

find /var/log -iname "*.log" 2>/dev/null -type f -readable | xargs wc -l | grep -v "Permission denied"
