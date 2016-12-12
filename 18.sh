#!/bin/bash

FILE=18-numbers.txt
depth=`cat $FILE | wc -l`
candidates=""
result=0

for (( i=1;i<=$depth;i++ )); do
   line=`sed -n ${i}p $FILE`
   if [ $i -eq 1 ];then
       candidates=" $line "
   else
       cursor=1
       echo $candidates 
       for option in $candidates; do
           next1=`echo $line | awk -F' ' -v a=$cursor         '{ print $a }' | sed 's/^0//' `
           next2=`echo $line | awk -F' ' -v b=$(( cursor+1 )) '{ print $b }' | sed 's/^0//' `
           candidates+="$(( option+next1 )) $(( option+next2 )) "
           candidates=`echo "$candidates" | sed "s/ $option / /"`
           let cursor++
       done
       num_candidates=`echo "$candidates" | awk -F' ' '{ print NF }'`
       j=3
       while [ $j -lt $num_candidates ]; do
           a=`echo "$candidates" | awk -F' ' -v a=$(( j-1 )) '{ print $a }'`
           b=`echo "$candidates" | awk -F' ' -v b=$j         '{ print $b }'`
           if [ $a -ge $b ];then
                candidates=`echo "$candidates" | sed "s/ $a $b / $a /"`
           else
                candidates=`echo "$candidates" | sed "s/ $a $b / $b /"`
           fi
           num_candidates=`echo "$candidates" | awk -F' ' '{ print NF }'`
           let j++
       done
   fi
done

echo "$candidates"

for max in $candidates; do
    [ $max -gt $result ] && result=$max
done
echo Result: $result
