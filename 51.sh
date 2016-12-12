#!/bin/bash
set -x
export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number of digits"
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

function check_if_you_have_a_family {
number=$i

    for (( j=1;j<digits;
}

[ "$#" -eq 1 ] || error

digits=$1
min=`echo "(10^($digits-1))+1" | bc`
max=`echo "(10^$digits)-1" | bc`

for (( i=$min;i<=$max;i+=2 )); do
    is_prime $i
    if [ $prime -eq 1 ]; then
        check_if_you_have_a_family
    fi
done
