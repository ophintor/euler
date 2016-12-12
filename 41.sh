#!/bin/bash

export BC_LINE_LENGTH=0

a=1
max=0

function is_pandigital {
    pandigital=0
    sorted_number=`echo $1 | sed 's/./& /g' | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ //g' `
    [ "$sorted_number" == "123456789" ] && pandigital=1
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


num=987654321
found=0

while [ $found -eq 0 ];do
    is_pandigital $num
    if [ $pandigital -eq 1 ]; then
        echo Checking if $num is prime...
        is_prime $num
        [ $prime -eq 1 ] && echo "found: $num" && break
    fi
    if   [ "${num: -8}" == "12345678" ];then
        let num-=99999999
    elif [ "${num: -7}" == "1234567" ];then
        let num-=9999999
    elif [ "${num: -6}" == "123456" ];then
        let num-=999999
    elif [ "${num: -5}" == "12345" ];then
        let num-=99999
    elif [ "${num: -4}" == "1234" ];then
        let num-=9999
    elif [ "${num: -3}" == "123" ];then
        let num-=999
    elif [ "${num: -2}" == "12" ];then
        let num-=99
    else
        let num-=9
    fi
done

