#!/bin/bash
total=$(free -m | awk '/Mem:/ {print $2}')
limit=$((($total*8)/10))
echo "$total:$limit"
while [[ "$limit" -ge "$line" ]]
do
line=$(free -m | awk '/Mem:/ {print $3}')
echo "used: $line"
progress=$(($line * 2))
if [[ "$line" -ge "$progress" ]]
then
echo "Twice or more"
fi
sleep 1
done
echo "Limit reached"
