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

function is_tr_prime {

    tr_prime=1
    number=$1
    digits=${#number}

    for (( d=1;d<=$digits;d++));do
        for pos in 0 $((digits-d));do
            subn=${number:$pos:$d}
            #echo $subn
            [ $subn -eq 0 ] && tr_prime=0 && break
            is_prime $subn
            if [ $prime -eq 0 ]; then
                tr_prime=0 && break
            fi
        done
    done
}


tr_primes=0
result=0
i=11

while [ $tr_primes -lt 11 ];do
    digits=${#i}
    valid_n=1
    for (( pos=1;pos<$(( digits-1 ));pos++ ));do
        [ ${i:pos:1} -ne 3 ] && [ ${i:pos:1} -ne 5 ] && [ ${i:pos:1} -ne 7 ] && [ ${i:pos:1} -ne 9 ] && valid_n=0 && break
    done
    if [ $valid_n -eq 1 ];then
         is_tr_prime $i 
         #echo $i - tr prime? $tr_prime
         [ $tr_prime -eq 1 ] && let tr_primes++ && echo found $i && let result+=$i 
    fi
    let i+=2
    [ $(( i%1111 )) -eq 0 ] && echo Over $i... >> /tmp/37.txt
done

echo Solution: $result
