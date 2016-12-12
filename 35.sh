#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number of divisors"
    exit 1
}

function is_prime {
prime=1
num=`echo $1 | sed 's/^[0]*//g'`

    [ $num -eq 1 ] && prime=0 
    for (( z=2;z<$num;z++ )); do
        if [ $(( num%z )) -eq 0 ]; then
            prime=0
            break
        fi
    done
}

function is_circular_prime {
circular_prime=1
number=$1

    for (( j=1;j<=${#number};j++ )); do
        is_prime $number
        if [ $prime -eq 0 ]; then
             circular_prime=0
             break
        fi
        number="${number:1}${number:0:1}"
        #echo "turned num $num"
    done
}

[ "$#" -eq 1 ] || error

function all_digits_odd {
all_odd=1
number=$1

   for (( digit=0;digit<${#number};digit++ ));do
       d=${number:${digit}:1}
       [ $d -eq 0 ] && all_odd=0 && break
       [ $(( d%2 )) -eq 0 ] && all_odd=0 && break
       [ $(( d%5 )) -eq 0 ] && all_odd=0 && break
   done
}

circular_primes=2 # We count the 2 and 5 already, as we wont consider them after
max=$1

for (( i=1;i<$max;i=i+2 )); do
    all_digits_odd $i
    if [ $all_odd -eq 1 ]; then
        is_circular_prime $i 
        echo $i - circular prime? $circular_prime
        [ $circular_prime -eq 1 ] && let circular_primes++
    fi
done

echo Solution: $circular_primes
