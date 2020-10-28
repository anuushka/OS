#!/bin/bash
#to list crontab task: crontab -l
#to remove crontab task: crontab -r
#show crontab: crontab -e
# * * * * * : minute hour day of month month day
#Run command at 15:00 everyday from Mon-Fri : 0 15 * * 1-5 command

echo "*/5 * * * 6 ~/lab3/task1.sh" >> tmp
crontab tmp
