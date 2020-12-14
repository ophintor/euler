#!/bin/bash

function error {
    echo "Incorrect number of parameters, expecting limit"
    exit 1
}

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

function get_divisors_sum {
number=$1
divisors=""
    for (( j=1;j<$(( (number/2)+1 ));j++ )); do
        if [[ $(( $number%$j )) -eq 0 ]]; then
             divisors="${divisors}+${j}"
        fi
    done
    sum=`echo ${divisors:1} | bc`
    #echo D $number = $sum
}


[ "$#" -eq 1 ] || error


max=$1
file=/tmp/21candidates
amicables=""
cat /dev/null > $file

for (( i=1;i<$max;i++ ));do
    is_prime $i
    if [ $prime -eq 0 ];then
         get_divisors_sum $i
         if [ $sum -gt $i ];then
             echo "$i $sum" >> $file
         elif [ $i -gt $sum ] && [[ `grep "$sum $i" $file | wc -l` -eq 1 ]];then
                 amicables="$amicables $i $sum"
         fi         
    fi
    if [ $(( i%500 )) -eq 0 ];then
       echo Still on $i...
    fi
done

cat $file
echo
echo Solution: `echo $amicables | sed 's/ /+/g' | bc`
