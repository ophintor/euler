#!/bin/bash

export BC_LINE_LENGTH=0

a=1
max=0

function is_pandigital {
sorted_number=`echo $1 | sed 's/./& /g' | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ //g' `
}


for (( a=1;a<9999;a++ ));do
    [ $(( a%200 )) -eq 0 ] && echo "Checking $a..."
    n=9
    size=9
    while [ $size -ge 9 ]; do
        num=""
        for (( i=1;i<=$n;i++ ));do
            num+=`echo "$a*$i" | bc`
            #echo "$a x $i = $num"
        done
        size=${#num}
        #echo a $a n $n num $num
        if [ $size -eq 9 ]; then
            is_pandigital $num
            let n--
            [ "$sorted_number" == "123456789" ] && echo "Found pandigital $num" && \
            [ $num -gt $max ] && let max=$num
        elif [ $size -gt 9 ]; then 
            let n--
        fi
    done
done
echo Solution: $max
