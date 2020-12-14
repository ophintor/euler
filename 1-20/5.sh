#!/bin/bash

echo Insert number:
read number

function still_valid {
num=$1
valid=1
   for (( i=2;i<=$number;i++ )); do
       if [[ $(( num%i )) -ne 0 ]];then
           valid=0
           break
       fi
   done
}


lower=`seq -s "*" 1 $number | bc`
candidate=$lower;

for (( j=2;j<=$number;j++ )); do
    while [ true ]; do
        candidate=$(( lower/j ))
        still_valid $candidate
        if [[ valid -eq 0 ]]; then
            break
        fi
        lower=$candidate
    done
done

echo Result: $lower
