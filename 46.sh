#!/bin/bash

export BC_LINE_LENGTH=0

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

function get_primes_until {
first=$(( `echo $primes_list | awk -F' ' '{ print $NF }'`+2 ))
last=$1
for (( i=$first;i<$last;i+=2 ));do
    is_prime $i
    [ $prime -eq 1 ] && primes_list+="$i "
done
}

function next_composite {
prime=1
while [ $prime -eq 1 ];do
    let composite+=2
    is_prime $composite
done
}

composite=9
primes_list="2 3 5 7 "

while [ true ]; do
    get_primes_until $composite
    for prime_candidate in $primes_list; do
        n=0
        valid=1
        #echo "$prime_candidate+(2*($n^2)) < $composite ?"
        #read
        while [ `echo "$prime_candidate+(2*($n^2))" | bc` -le $composite ];do
            #echo "$prime_candidate+(2*($n^2)) = $composite ?"
            #read
            if [ `echo "$prime_candidate+(2*($n^2))" | bc` -eq $composite ]; then
                valid=0
                echo "$composite not valid : $composite = $prime_candidate + 2*$n^2"
                break
            fi
            let n++
        done
        [ $valid -eq 1 ] || break
    done    
    [ $valid -eq 1 ] && echo "Found! $composite proves Goldbach was wrong" && break
    next_composite
    #read
done
