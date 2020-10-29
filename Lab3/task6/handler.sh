#!/bin/bash

MODE="+"
NUM=1

echo $$ > .pid

usr1()
{
    MODE="+"
}
usr2()
{
    MODE=\*
}
stop()
{
    MODE="STOP"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'usr3' stop

while true
do
    case "$MODE" in
          "+")
                NUM=$(echo "${NUM} + 2" | bc);;
          \*)
                NUM=$(echo "${NUM} * 2" | bc);;        
          "STOP")
                echo "Exit"
                exit 0
                ;;
    esac
    sleep 1
    echo $NUM
done
