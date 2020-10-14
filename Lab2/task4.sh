#!/bin/bash
# tail -n +2 : all processes except the first line (header)
for pid in $(ps -Ao pid | tail -n +2)
do
ParentID=$(grep -Ehsi "^PPid" /proc/$pid/status | grep -o "[0-9]\+")
sumexec=$(grep -Ehsi "sum_exec_runtime" /proc/$pid/sched | grep -o "[0-9]\+")
nr_switch=$(grep -Ehsi "nr_switches" /proc/$pid/sched | grep -o "[0-9]\+")
if [[ -n $ParentID ]]
then
ART=$((sumexec / nr_switch))
echo $pid ":" $ParentID ":" $ART
fi
done |
sort --key=2 -V > task4.out
