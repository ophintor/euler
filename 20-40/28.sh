#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting size"
    exit 1
}

[ "$#" -eq 1 ] || error

size=$1
result=1
pos=1

for (( a=3;a<=$size;a=a+2 )); do
    for (( i=1;i<=4; i++ )); do
         pos=`echo "$pos+($a-1)" | bc`
         result=`echo "$result+$pos" | bc`
    done
done
echo $result
