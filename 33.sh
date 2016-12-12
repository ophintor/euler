#!/bin/bash

export BC_LINE_LENGTH=0
nn=""
dd=""

for (( n=11;n<100;n++ )); do
    for (( d=$(( n+1 ));d<100;d++ )); do
         if [ $(( n%10 )) -ne 0 ] && [ $(( d%10 )) -ne 0 ];then
              value=`echo "scale=3; $n/$d" | bc`
              [ ${n:0:1} -eq ${d:0:1} ] && [ "`echo "scale=3; ${n:1:1}/${d:1:1}" | bc`" == "$value" ] && nn+="${n:1:1} " && dd+="${d:1:1} "
              [ ${n:0:1} -eq ${d:1:1} ] && [ "`echo "scale=3; ${n:1:1}/${d:0:1}" | bc`" == "$value" ] && nn+="${n:1:1} " && dd+="${d:0:1} "
              [ ${n:1:1} -eq ${d:0:1} ] && [ "`echo "scale=3; ${n:0:1}/${d:1:1}" | bc`" == "$value" ] && nn+="${n:0:1} " && dd+="${d:1:1} "
              [ ${n:1:1} -eq ${d:1:1} ] && [ "`echo "scale=3; ${n:0:1}/${d:0:1}" | bc`" == "$value" ] && nn+="${n:0:1} " && dd+="${d:0:1} "
         fi
    done
done

nn=`echo $nn | sed 's/ /*/g' | bc`
dd=`echo $dd | sed 's/ /*/g' | bc`

for (( div=2;div<=$nn;div++ )); do
    while [ $(( nn%div )) -eq 0 ] && [ $(( dd%div )) -eq 0 ];do
        let nn/=$div
        let dd/=$div
        echo "$nn/$dd"
    done
done
echo Solution: $dd
