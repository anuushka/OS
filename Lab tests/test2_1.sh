#Вывести список pid всех активных процессов. Процесс работает не больше минуты
ps -eo pid,etimes | awk '{if ($2 <= 60) print $1 " : " $2}'

#Вывести список pid всех спящих процессов. Процесс работает не больше минуты.
ps h -eo s,pid,etimes | awk '{ if (($1 == "S" || $1 == "D") && $3 <= 60) { print $1 ":" $2 ":" $3 } }'

#Вывести топ 3 процессов с наибольшим использованием CPU, Процессы запущены от root (maybe.. sth like this)
ps -Ao user,pid,pcpu --sort=-pcpu |  awk '{if ($2 == "root" print $1 ":" $3}' | head -n 4 

top -b -o +VIRT | head -n 8 | tail -n 2 >> task6.out

