#Вывести топ 3 процессов с наибольшим использованием CPU/ Output top 3 of processes which have max CPU
#Процесс работает не больше минуты / Processes is working less than 1 minute

ps -Ao pid,pcpu,etimes --sort=-pcpu | awk '{if( $3 <= 60 ) print "PID: " $1 " CPU: " $2 " Elapsed Time: " $3 }' | head -n 3
