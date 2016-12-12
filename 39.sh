#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting max perimeter"
    exit 1
}

function find_solutions {
perim=$1
limit=$(( perim-2 ))
h=$limit
num_solutions=0

echo Trying p=$perim
for (( c1=1;c1<=$limit;c1++ )); do
    [ $h -le $c1 ] && break
    for (( c2=1;c2<$limit;c2++ )); do
        h=$(( perim-c1-c2 ))
        [ $h -le $c2 ] && break
        #echo $h - $c1 $c2
        if [ `echo "($h^2)" | bc` -eq `echo "($c1^2)+($c2^2)" | bc` ]; then
            let num_solutions++
            echo "Perim: $perim, $h^2 = $c1^2 + $c2^2"
        fi
    done
done
}



[ "$#" -eq 1 ] || error

max=$1
solutions=0

for (( p=1;p<=$max;p+=2 )); do
    find_solutions $p
    if [ $num_solutions -gt $solutions ]; then
        echo "Found $p has $num_solutions" 
        let solutions=$num_solutions
        let candidate=$p
    fi
done
echo Final solution: $candidate has $solutions


