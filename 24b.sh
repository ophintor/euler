#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting n in {0..n}"
    exit 1
}

[ "$#" -eq 1 ] || error

counter=0
max=$1
param=""

for (( i=0;i<=max;i++ ));do
    param+="{0..$max}"
done

eval "echo $param | tr ' ' '\n' | grep -E -v '([[:digit:]]).*\1'"

