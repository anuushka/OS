#!/bin/bash
# E - extended regex
# h - no filename
# r - recursive search in all subfolder etc
# s - no error message

grep -E -h -r -s "INFO.*" "/var/log/anaconda/syslog" > info.log
grep -E -h -r "^.*[[:alnum:]]\.*[[:alpha:]]" info.log
