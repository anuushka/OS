#!/bin/bash

ppid=-1
avgruntime=0
counter=0

while read line
do
  new_ppid=$(echo $line | grep -Ehsio "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
  new_avgruntime=$(echo $line | grep -Ehsio "Average_Running_Time=[0-9]+" | grep -o "[0-9]\+")
    if (( ppid != -1 && new_ppid != ppid ))
    then
    avg=$(echo "scale=2; $avgruntime / $counter" | bc -l)
    echo Average_Sleeping_Children_of_ParentID=$ppid is $avg
    avgruntime=0
    counter=0
    fi
  echo $line
  avgruntime=$(echo "$avgruntime + $new_avgruntime" | bc -l)
  counter=$((counter + 1))
  ppid=$new_ppid
done < task4.out > task5.out

echo Average_Sleeping_Children_of_ParentID=$ppid is $(echo "scale=2; $avgruntime / $counter" | bc -l) >> task5.out


