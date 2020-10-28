#!/bin/bash

now=$(date '%y.%m.%d.%H.%M.%S')
report=~/lab3/report
mkdir $HOME/test && echo "Catalog test was created succesfully" > $report && touch ~/lab3/$now
ping -c1 www.net_nikogo.ru && echo "Verified" || echo "$now Host Down " >> $report
rm -r test
