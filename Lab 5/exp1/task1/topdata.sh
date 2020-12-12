#!/bin/bash

rm top.log
touch top.log
echo "" > top.log
while true
do
top -b | head -n 13 >> top.log
sleep 0.2
done
