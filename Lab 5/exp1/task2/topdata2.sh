#!/bin/bash

./mem.bash &
./mem2.bash2 &
rm top2.log
touch top2.log
echo "" > top2.log
while true
do
top -b | head -n 13 >> top2.log
sleep 0.2
done
