#!/bin/bash
N=1530507
K=30
while (( $K > 0 ))
do 
./newmem.bash $N &
let K--
sleep 1
done
