#!/bin/bash

echo "1: nano"
echo "2: vi"
echo "3: browser links"
echo "4: exit"
echo "Please enter choice: "

while true
do
  read ans
    case $ans in
      1) nano ;;
      2) vi ;;
      3) links ;;
      4) exit 0 ;;
   esac
 done
