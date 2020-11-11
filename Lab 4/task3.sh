#!/bin/bash
#backup files

now=$(date "+%F")
now_seconds=$(date -d $now +"%s")
backup_date=$(ls ~ | grep -o -E "^Backup-[0-9]{4}-[0-9]{4}-[0-9]{4} | cut -d "-" -f 2,3,4 | sort -n -r | head -n 1)
backup_seconds=$(date -d "$backup_date" +"%s")
elapsed_days=$(echo "($now_seconds - $backup_seconds)/(60 * 60 * 24)" | bc -l)

last_dir="$HOME/Backup-$backup_date"
now_dir="$HOME/Backup-$now"
report="$HOME/backup-report"
source="$HOME/source"

if [[ ! -d $source ]]
then
  echo "Directory source doesnt exist"
  exit 1
fi

if (( $elapsed_days > 7 )) || [[ -z $backup_date ]]
then
  mkdir $now_dir
  for file in $(ls $source)
  do
    cp $source/$file $now_dir
  done
  files=$(ls $source)
  echo -e "Backup created at $now in $now_dir:\n$files" >> $report
else
  for file in $(ls $source)
  do
    if [[ -f $last_dir/$file ]]
    then
      srcSize=$(stat $source/$file -c%s)
      bcpSize=$(stat $last_dir/$file -c%s)
      if [[ $srcSize -ne $bcpSize ]]
      then
        mv $last_dir/$file $last_dir/$file.$now
        cp $source/$file $last_dir/$file
        echo "$now: $file was renamed to $file.now and copied to $last_dir" >> $report
      fi
    else
      cp $source/$file $last_dir
      echo "$now: $file was copied to $last_dir" >> $report
    fi
  done
fi

