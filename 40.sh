#!/bin/bash

i=0
decimal=0
base=10
exp=0
d=`echo "10^$exp" | bc`
result=1

while [ $exp -lt 6 ]; do
    let i++ 
    size=${#i}
    let decimal+=$size
    if [ $decimal -ge $d ]; then
        pos=$(( d-decimal+size-1 ))
        digit=${i:$pos:1}
        let result*=$digit
        let exp++ 
        d=`echo "10^$exp" | bc`
    fi
done
 
echo Result: $result
