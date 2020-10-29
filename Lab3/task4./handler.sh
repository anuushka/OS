#!/bin/bash
#./script.sh& : run in background
#$!: get pid of the last executed background process
#pkill : kill by process name
#renice better than cpulimit because cpulimit works in multiple cores. renice works in automatic mode.

./generator.sh& 
pid1=$!
./generator.sh&
pid2=$!
./generator.sh&
pid3=$!


echo $pid1
echo $pid2
echo $pid3

renice +10 -p $pid1

at now + 1 minute <<< "kill $pid3"
at now + 2 minutes <<< "pkill generator.sh"
