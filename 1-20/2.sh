#!/bin/bash

total=0
previous=0 
current=1


echo Insert number:
read number


while [ $current -le $number ]; do

    temp=$current;
    let current=$current+$previous
    previous=$temp

    if [ $(( current%2 )) -eq 0 ]; then
        let total=$total+$current
    fi
done

echo $total

