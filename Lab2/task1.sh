#!/bin/bash
ps -aux | wc -l > user.txt
ps -aux | awk '{print $2 ":" $11}' >> user.txt
