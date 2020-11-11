#!/bin/bash
#sed s/string1/string2 : replace string 1 with string 2

inf="\\(II\\)"
war="\\(WW\\)"

grep -E -h -s $war /var/log/anaconda/X.log | sed -E "s/$war/Warning: /" > full.log 
grep -E -h -s $inf /var/log/anaconda/X.log | sed -E "s/$inf/Informarion: /" >> full.log
