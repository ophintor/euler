#!/bin/bash

echo Insert number:
read number

function sum_of_squares {
num=$1
sum1=0
for (( i=1;i<=$num;i++ ));do
    sq=$(( i*i ))
    sum1=$(( sum1+sq ))
done
}

function square_of_sum {
num=$1
sum2=0
for (( i=1;i<=$num;i++ ));do
    sum2=$(( sum2+i ))
done
sum2=$(( sum2*sum2 ))
}

sum_of_squares $number
square_of_sum  $number

echo Result: $(( sum2-sum1 ))
