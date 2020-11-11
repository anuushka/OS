#!/bin/bash

if [[ $HOME == $PWD ]]
then
  echo $HOME
  exit 0
else
  echo "Directory is not HOME"
  exit 1
fi
