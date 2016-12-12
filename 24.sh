#!/bin/bash

export BC_LINE_LENGTH=0

a=1
max=0

function is_pandigital {
    pandigital=0
    sorted_number=`printf '%.10d\n' $1 | sed 's/./& /g' | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ //g' `
    [ "$sorted_number" == "0123456789" ] && pandigital=1
}

num="123456789"
counter=0

while [ $counter -lt 1000000 ];do
    is_pandigital $num
    if [ $pandigital -eq 1 ]; then
        let counter++
        printf '%.10d' $num
        echo " : $counter"
    fi
    if   [ "${num: -9}" == "987654321" ];then
        let num+=99999999
    elif   [ "${num: -8}" == "87654321" ];then
        let num+=99999999
    elif [ "${num: -7}" == "7654321" ];then
        let num+=9999999
    elif [ "${num: -6}" == "654321" ];then
        let num+=999999
    elif [ "${num: -5}" == "54321" ];then
        let num+=99999
    elif [ "${num: -4}" == "4321" ];then
        let num+=9999
    elif [ "${num: -3}" == "321" ];then
        let num+=999
    elif [ "${num: -2}" == "21" ];then
        let num+=99
    else
        let num+=9
    fi
done

