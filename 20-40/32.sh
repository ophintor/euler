#!/bin/bash

export BC_LINE_LENGTH=0

total=0 
products=""

function check_digits {
all_different=0
   [ `echo "$i$j$k" | sed 's/./&\n/g' | sort | tr '\n' ' ' | sed 's/ //g'` == "123456789" ] && all_different=1
}

for (( i=2;i<10000;i++ )); do
    for (( j=$(( 10000/(i*10) ));j<$(( 10000/i ));j++ )); do
         k=`echo $i*$j | bc`
         check_digits $i $j $k 
         if [ $all_different -eq 1 ] && [[ "$products" != *$k* ]];then
             let total+=$k
             echo "$i x $j = $k"
             products+="$k "
             echo products $products total $total
         fi
    done
done

echo Solution: $total
