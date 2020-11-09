#!/bin/bash

prompt=$1
dir=$HOME/trash
log=$HOME/trash.log

if [[ $# -ne 1 ]]
then 
echo "Invalid argument"
fi

if [[ -z $(grep -s $prompt $log) ]]
then
echo "File $prompt doesn't exist"
exit 1
fi

for i in $(grep -s $prompt $log)
do
name=$(echo $i | awk -F ':' '{print $1}')
location=$(echo $i | awk -F ':' '{print $2}')
id=$(echo $i | awk -F ':' '{print $3}')
linkfile=$dir/$id

if [[ -f $linkfile ]]
then
  read -p "Do you want to restore $location/$name (y/n) ?" answer
  if [[ "$answer" == "y" ]]
  then
    path=$(dirname "$location")
    if [[ -d $path ]]
    then
      if [[ -f $path/$prompt ]]
      then
        read -p "File already exists. Rename: "  newfile
        ln $linkfile $path/$newfile
        rm $linkfile
        echo "Renamed and restored file in ORIGINAL directory"
       else
       ln $linkfile $path/$prompt
       rm $linkfile
       echo "Restored file in ORIGINAL directory"
      fi
    else
     if [[ -f $HOME/$prompt ]]
      then
        read -p "Original directory doesnt exist. File already exists in HOME. Rename: "  newfile
        ln $linkfile $HOME/$newfile
        rm $linkfile
        echo "Renamed and restored file in HOME directory"
      else
       ln $linkfile $HOME/$prompt
       rm $linkfile
       echo "Restored file in HOME directory"
      fi
    fi
  fi
fi
done
