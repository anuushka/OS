#!/bin/bash
ps -Ao pid,start --sort=start_time | tail -n 1 | awk '{print "PID: " $1, "start:" $2 }' > task3.out
