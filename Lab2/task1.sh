#!/bin/bash
# a selecting all processes
# u selecting all processes, including those of other users
# x select all processes without controlling types
# ps -o user,pid,command --> list each column of processes

#ps -aux > user.txt
#awk '{if ($1 == "user") {print $0}}' user.txt >> user.txt

#ps -aux | wc -l > user.txt
#ps -aux | awk '{print $2 ":" $11}' >> user.txt

ps -U user -u user --no-headers -o pid,command | awk '{print $1 ":" $2}' > task1.out
echo Count: $(cat task1.out | wc -l) >> task1.out



