#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number"
    exit 1
}

[ "$#" -eq 1 ] || error

max=$1
result=0

echo "Starting from the bottom..."
for (( a=1;a<$max;a++ )); do
    for (( b=1;b<$max;b++ )); do
       sum=`echo $a^$b | bc | sed 's/./&+/g' | sed 's/+$//' | bc`
       [ $sum -gt $result ] && echo "$a^$b gives a sum of $sum" && result=$sum
    done
done
