#!/bin/bash

export BC_LINE_LENGTH=0
grand_total=0

for (( i=3;i<100000;i++ )); do
    numbers=`echo $i | sed "s/./& /g"`
    total=0 
    for j in $numbers; do
        if [ $j -eq 0 ];then
             fact=1
        else
             fact=`seq -s "*" 1 $j | bc`
        fi
        let total+=$fact
    done
    [ $total -eq $i ] && let grand_total+=$total && echo $i found
done
echo Result: $grand_total
