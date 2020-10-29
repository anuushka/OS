#!/bin/bash

while true
do
  read LINE
  echo "$LINE" > pipe
  if [[ "$LINE" == "QUIT" ]]
  then
    exit 0
  elif [[ ( "$LINE" != "+" ) && ( "$LINE" != "*" ) && ( "$LINE" != *[[:digit:]]* ) ]]
  then
    echo "Incorrect Input"
    exit 1
  fi
done
