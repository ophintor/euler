#!/bin/bash

found=0

function is_prime {
prime=1
num=$1
    for (( z=2;z<$num;z++ )); do
        if [ $(( num%z )) -eq 0 ]; then
            prime=0
            break
        fi
    done
}

echo Insert number:
read number

ultimo=$(( number/2 ))

while [ $found -eq 0 ]; do
for (( i=2;i<=$ultimo;i++ )); do
#   echo i $i
#   echo number $number
#   echo found $found
#   echo ultimo $ultimo

   if [ $(( number%i )) -eq 0 ]; then 
       let candidate=$(( number/i ));
       echo =================================
       echo candidate $candidate
       is_prime $candidate
       if [ $prime -eq 1 ]; then
          echo Found: $candidate
          exit 0
       fi
       echo NOT PRIME
       echo =================================
   fi
done
done
