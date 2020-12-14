#!/bin/bash

export BC_LINE_LENGTH=0

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


function get_consecutive_primes {
cons_primes=0
n=0

    while (true); do
        number=`echo "($n^2)+($a*$n)+$b" | bc | sed 's/^-//g'`
        is_prime $number
        if [ $prime -eq 1 ];then
            let cons_primes++
            echo "prime found ($n^2)-($a*$n)+$b=$number" >> /tmp/27primes.txt
            let n++
        else
            break
        fi
    done
}


max_cons_primes=0
solution=0
for (( a=-999;a<=999;a++ )); do
    for (( b=-999;b<=999;b++ )); do
        get_consecutive_primes
        [ $cons_primes -gt $max_cons_primes ] && max_cons_primes=$cons_primes && solution=$(( a*b )) && echo $a x $b - $max_cons_primes primes
    done
done
echo Solution: $solution
