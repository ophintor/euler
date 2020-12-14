#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number"
    exit 1
}

[ "$#" -eq 1 ] || error

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

limit=$1
i=$(( limit/2 ))
count=0
result=0
found=0
primes_list="2 "

for (( i=3;i<$(( limit/2 ));i=i+2 )); do
      is_prime $i
      if [ $prime -eq 1 ];then 
          primes_list+="$i "
      fi
done
echo $primes_list
echo list complete

#while [ $found -eq 0  ]; do
#   let i-- 
#   is_prime $i
#   if [ $prime -eq 1 ];then 
#       let result+=$i
#       let count++
#       echo $count $i
#   fi
#done
##echo $result
