#!/bin/bash
#sleep 3
#tail -n 0 -f ~/lab3/report
#./task1.sh&

#should use at not sleep - at – осуществляет однократный отсроченный запуск команды. 

at now +2 minutes -f ./task1.sh
tail -n 0 -f ~/lab3/report
