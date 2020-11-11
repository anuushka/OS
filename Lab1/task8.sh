#!/bin/bash
# awk -F : separator ; awk - pattern scanning and processing 
# sort -n : sort numerically
# awk {print $1, $2} : 1st and 2nd field 

file="/etc/passwd"
awk -F: '{print $3 " " $1} $file | sort -n > uid.log
awk -F: '{print $3 " " $1} $file | sort -n
