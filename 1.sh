#!/bin/bash

total=0

echo Insert number:
read number

for (( i=1;i<$number;i++ )); do
    if [ $(( i%3 )) -eq 0 ] || [ $(( i%5 )) -eq 0 ]; then
        let total=$total+$i
    fi
done    

echo $total

