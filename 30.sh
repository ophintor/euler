#!/bin/bash

function error {
    echo "Incorrect number of parameters, expecting exponent"
    exit 1
}

[ "$#" -eq 1 ] || error

exp=$1
total=0

for (( i=2;i<=200000;i++ ));do
    [ `echo $i | sed "s/./(&^$exp)+/g" | sed 's/+$//' | bc` -eq $i ] && let total+=$i && echo $i+
done
echo =$total
