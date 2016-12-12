#!/bin/bash

largest=0

function is_palindrome {
pal=0
num=$1
rev=`echo $1 | rev`
if [ $num -eq $rev ]; then
    pal=1
fi
}

for (( i=999;i>99;i-- )); do
    for (( j=999;j>99;j-- )); do
        candidate=$(( i*j ))
        if [ $candidate -gt $largest ]; then
            is_palindrome $candidate
            if [ $pal -eq 1 ]; then
                largest=$candidate;
                echo Largest so far $largest
            fi
        fi
    done
done

echo Result: $largest
