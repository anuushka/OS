#!/bin/bash

tmp=""
while true
do 
  read str
  if [[ "$str" == "q" ]]
  then
    break
  fi
tmp=$tmp$str
done
echo "Substring: $tmp"
