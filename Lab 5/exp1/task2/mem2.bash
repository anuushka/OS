#!/bin/bash

declare -a arr
counter=0
elements=(1 2 3 4 5 6 7 8 9 10)
touch report2.log
echo "" > report2.log
while true
do 
arr+=(${elements[@]}
let counter++
if [[ "$counter" -eq 100000 ]]
then
counter=0
echo "${#arr[@]}" >> report2.log
fi
done
