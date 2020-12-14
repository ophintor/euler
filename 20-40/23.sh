#!/bin/bash

export BC_LINE_LENGTH=0
ab_list=/tmp/23abundant.txt
solution=0

function get_divisors_sum {
number=$1
sum=0
    [ $number -eq 1 ] && sum=1 
    for (( j=$(( (number/2) ));j>=1;j-- )); do
        if [[ $(( $number%$j )) -eq 0 ]] ; then
             sum=$(( sum+j ))
             [[ $sum -gt $number ]] && sum=$(( number+1 )) && break
        fi
    done
    #sum=`echo ${divisors:1} | bc`
    #echo D $number = $sum
}


cat /dev/null > $ab_list

for (( i=1;i<=28500;i++ )); do
    get_divisors_sum $i
    [ $sum -gt $i ] && echo "$i" >> $ab_list
    valid=1
    for ab in `cat $ab_list`; do
        if [ $ab -lt $i ] && [ `grep "^$(( i-ab ))$" $ab_list | wc -l` -eq 1 ];then
             valid=0
             #echo "Number not valid $ab+$(( i-ab ))=$i"
             #echo `cat $ab_list`
             break
        fi
    done
    [ $valid -eq 1 ] && echo VALID NUMBER: $i && let solution+=$i
done
echo $solution
