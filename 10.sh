#!/bin/bash

function is_prime2 {
prime=1
num=$1
    for (( z=2;z<$num;z++ )); do
        if [ $(( num%z )) -eq 0 ]; then
            prime=0
            break
        fi
    done
}

function is_prime {
prime=0
if [[ `factor $1 | wc -w` -eq 2 ]]; then
    prime=1
fi
}

echo Insert number:
read number

total=0

for (( i=2;i<number;i++ )); do
    is_prime $i
    if [[ prime -eq 1 ]]; then
        total=$(( total+i ))
    fi
    if [ $(( i%10000 )) -eq 0 ]; then
       echo $i and counting...
    fi
done

echo The sum of all the primes under ${number} is $total
