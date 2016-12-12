#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting limit"
    exit 1
}

[ "$#" -eq 1 ] || error

function is_palindrome {
word=$1

if [ ${#word} -le 1 ]; then
    palindrome=1
elif [ ${word:0:1} -eq ${word: -1} ]; then
    is_palindrome ${word:1:-1}
else
    palindrome=0
fi

}

max=$1
count=0

for (( dec=0;dec<$max;dec++ )) {
    bin=`echo "ibase=10;obase=2;$dec" | bc`
    is_palindrome $dec
    [ $palindrome -eq 1 ] && is_palindrome $bin
    [ $palindrome -eq 1 ] && let count+=$dec && echo "$dec $bin"
    [ $(( dec%10000 )) -eq 0 ] && echo "checking $dec"
}
echo Result: $count
