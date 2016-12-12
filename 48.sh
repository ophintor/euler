#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting limit"
    exit 1
}

[ "$#" -eq 1 ] || error

max=$1
result=0

for (( i=1;i<=$max;i++ )); do
   result=`echo "$result+($i^$i)" | bc`
done
echo ${result: -10}
