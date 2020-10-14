#!/bin/bash
ps -Ao pid,command | grep -E "*sbin"
