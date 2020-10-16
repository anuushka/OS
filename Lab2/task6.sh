#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2)
do
vmsize=$(grep -Ehsi "VmSize" /proc/$pid/status | grep -o "[0-9]\+")
if [[ -n $vmsize ]]
then
echo $pid ":" $vmsize
fi
done | sort --key=2 -V | tail -n 1 > task6.out
echo "-----------------------------------TOP VIRTUAL MEMORY---------------------------------------" >> task6.out
top -b -o +VIRT | head -n 8 | tail -n 2 >> task6.out
