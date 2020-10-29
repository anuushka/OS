#!/bin/bash

MODE="+"
NUM=1

(tail -f pipe) |
while true
  do 
  read LINE
  case $LINE in
    "+") 
         MODE="$LINE"
         echo "Mode: $LINE";;
    \*)  
         MODE="$LINE"
         echo "Mode: $LINE";;
    "QUIT") 
         echo "Exit"
         killall tail
         exit;; 
    [0-9]*)
        case $MODE in
          '+')
              NUM=$(echo "${NUM} + ${LINE}" | bc)
              echo $NUM;;
           \*)
              NUM=$(echo "${NUM} * ${LINE}" | bc)
              echo $NUM;;
              
            *)
               >&2 echo "Incorrect Mode: $MODE"
           
        esac
        ;;
     *)
        echo "Incorrect Input: $LINE"
        killall tail
        exit;;
        
  esac
done
         
