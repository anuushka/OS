#!/bin/bash

regex="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9._]+\.[A-Za-z]{2,6}\b"
path="/etc/"
file="emails.lst"
grep -E -h -s -o -r $regex $path | sort | uniq -u > $file
