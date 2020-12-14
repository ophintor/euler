#!/bin/bash

echo Insert number:
read number

for (( i=1;i<$number;i++ )); do
  for (( j=$i;j<$number;j++ )); do
    k=$(( number-i-j ))
    catetos=$(( (i*i)+(j*j) ))
    hipotenusa=$(( k*k ))
    if [ $catetos -eq $hipotenusa ]; then
       echo i $i j $j k $k catetos $catetos hipotenusa $hipotenusa
       echo Result: $(( i*j*k ))
       exit 0
    fi
  done    
done    

