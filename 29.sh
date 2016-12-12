#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting exponent"
    exit 1
}

[ "$#" -eq 1 ] || error

max=$1
file=/tmp/29numbers.txt

cat /dev/null > $file

for (( i=2;i<=$max;i++ ));do
    for (( j=2;j<=$max;j++ ));do
         candidate=`echo $i^$j | bc` 
         [ `grep ^${candidate}$ $file | wc -l` -eq 1 ] || echo $candidate >> $file
    done
done
echo Result: `cat $file | wc -l`
