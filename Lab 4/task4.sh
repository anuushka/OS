#!/bin/bash
#maxdepth -> level 0 -> directories Backup-[somedate] -> sort numerically by date

mkdir $HOME/restore
backup_dir=$(find ~/Backup-* -maxdepth 0 | sort -n | tail -n 1)

if [[ ! -d $backup_dir ]]
then
  echo "Directory backup doesn't exist"
  exit 1
fi

for file in $(ls $backup_dir | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}")
do
  cp $backup_dir/$file $HOME/restore/$file
done
