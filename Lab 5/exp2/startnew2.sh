#!/bin/bash
N="$(cat report3.log | tail -n 1)"
N=$((N/10))
echo $N
K=30
while (( K > 0 ))
do 
./newmem.bash $N &
let K--
sleep 1
done
