#!/bin/bash

function error {
    echo "Incorrect number of parameters, expecting number of digits"
    exit 1
}

[ "$#" -eq 1 ] || error

export BC_LINE_LENGTH=0
current=1
previous=0
term=1

while [ ${#current} -lt $1 ]; do
   echo "F${term} = $current (${#current})"
   tmp=$current
   current=`echo $current+$previous | bc`
   previous=$tmp
   let term++
done
echo "F${term} = $current (${#current})"
