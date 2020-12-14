#!/bin/bash

res1=$(date +%s.%N)

# Parameters: numbers of divisors to go beyond

function error {
    echo "Incorrect number of parameters, expecting number of divisors"
    exit 1
}

function get_divisors {
divisors=2 # we dont need to compute 1 or N
    for (( j=2;j<=$(( triangle_number/2 ));j++ )); do
        if [[ $(( triangle_number%j )) -eq 0 ]]; then
             let divisors++
        fi
    done
}


[ "$#" -eq 1 ] || error

max=0

triangle_number=1
next=2
counter=0

while true; do
    get_divisors
    if [[ $divisors -gt $max ]]; then 
        max=$divisors
        echo $triangle_number : $divisors divisors
    fi
    if [[ $divisors -gt $1 ]]; then
        echo Found: $triangle_number
        res2=$(date +%s.%N)
        echo Elapsed: `echo $res2-$res1 | bc`
        exit 0
    fi
    triangle_number=$(( triangle_number+next ))
    let next++
    let counter++
    if [ $counter -eq 1000 ];then
         echo 1000 more numbers analysed, current: $triangle_number
         date
         counter=0
    fi
done


