#!/bin/bash

function is_prime {
prime=1
num=$1
    for (( z=2;z<$num;z++ )); do
        if [ $(( num%z )) -eq 0 ]; then
            prime=0
            break
        fi
    done
}

echo Insert number:
read number

counter=0
candidate=1

while [[ counter -lt $number ]]; do
    let candidate++
    is_prime $candidate
    if [[ prime -eq 1 ]]; then
        let counter++
        if [[ $(( counter%500 )) -eq 0 ]]; then
             echo Found ${counter}th...
        fi
    fi
done

echo The ${number}th prime number is $candidate
