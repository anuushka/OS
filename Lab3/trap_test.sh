#getoutofinfiniteloop

#!/bin/bash

#function called by trap
do_this_on_ctrl_c(){
    echo "Exited the loop, there were $i number of loops executed !"
    date
    exit 0
}

trap 'do_this_on_ctrl_c' SIGINT

loopN=0

while true
do
    echo "Loop Number = $i"
    i=$(($i+1))
done
