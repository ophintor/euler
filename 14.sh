#!/bin/bash

# Parameters: numbers of divisors to go beyond

function error {
    echo "Incorrect number of parameters, expecting limit"
    exit 1
}

[ "$#" -eq 1 ] || error

max_terms=1

function collatz {
term=$i
counter=1
while [ $term -ne 1 ];do
    if [ $(( term%2 )) -eq 0 ];then
        term=$(( term/2 ))
    else
        term=$(( (3*term)+1 ))
    fi
    let counter++
done
if [ $counter -gt $max_terms ];then
    echo Max found: number $i, $counter terms
    max_terms=$counter
fi
}


max=$1

for (( i=2;i<$max;i++ ));do
    collatz
done



