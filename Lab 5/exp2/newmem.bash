#!/bin/bash

declare -a arr
elements=(1 2 3 4 5 6 7 8 9 10)
N=$1
while true
do 
arr+=(${elements[@]})
let counter++
if [[ "${#arr[@]}" -ge $N ]]
then
exit 0
fi
done
