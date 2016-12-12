#!/bin/bash


count=0
amount=200

function divide {
am=$1

if [ $am -eq 200 ]; then
    let count++
else
    let count++
    let am+=$am
    divide $am
fi

}

while [ $amount -gt 1 ]; do
    for i in 200 100 50 20 10 5 2 1; do
        divide $i
        echo i $i count $count
        read 
    done
done


