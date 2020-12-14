#!/bin/bash

FILE=13-numbers.txt
total=""
remainder=0

for (( i=50;i>0;i-- )); do
    number=`cat $FILE | sed -e 's/\(.\)/\1 /g' | awk -F' ' -v pos=$i '{ sum+=$pos } END { print sum }'`
    number=$(( number+remainder ))
    total=${number: -1}${total}
    remainder=${number:0:-1}
done

big_number=${remainder}${total}

echo Big number: $big_number
echo Solution: ${big_number:0:10}
