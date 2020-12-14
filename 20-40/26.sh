#!/bin/bash

function error {
    echo "Incorrect number of parameters, expecting limit"
    exit 1
}


[ "$#" -eq 1 ] || error

max=$1
scale=5000
pattern_lenght=0
export BC_LINE_LENGTH=0

for (( i=1;i<max;i++ )); do
    echo Checking 1/$i...
    number=`bc <<< "scale=$scale; 1/$i"`
    decimals=${number:1}
    #echo ${decimals}
    size_x_num=0

    for (( offset=1;offset<$(( scale/2 ));offset++ )); do
        pos=$(( scale-offset ))
        ocur=${decimals:$pos:$offset}
        num_ocur=`echo $decimals | grep -o $ocur | wc -l`
        size_ocur=$offset 
        if [ "$ocur" == "${decimals:$(( pos-offset )):$offset}" ] && 
           [ "$ocur" == "${decimals:$(( pos-(offset*2) )):$offset}" ] && 
           [ "$ocur" == "${decimals:$(( pos-(offset*3) )):$offset}" ];then
             candidate=$ocur
             break
        fi
    done

    if [ ${#candidate} -gt $pattern_lenght ];then
        pattern_lenght=${#candidate}
        sol_denom=$i
        sol_number=$number
        sol_cand=$candidate
        echo "Candidate 1/${sol_denom} Pattern: $sol_cand (${#sol_cand})"
    fi
done

echo
echo Solution
echo 1/${sol_denom}
echo "Pattern: $sol_cand (${#sol_cand})"


