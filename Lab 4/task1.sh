#!/bin/bash

dir=$HOME/trash
log=$HOME/trash.log
file=$1
id=$(uuidgen)

if [[ $# -ne 1 ]]
then
echo "invalid argument"
exit 1
fi

if [[ ! -f $file ]]
then
echo "invalid file"
exit 1
fi

if [[ ! -d $dir ]]
then 
mkdir $dir
touch $log
fi

ln $file $dir/$id
rm $file && echo "$file:$(realpath $file):$id" >> $log

