#!/bin/bash

export BC_LINE_LENGTH=0

found=0
number=10
counter=0

while [ $found -eq 0 ]; do
    digits_list=`echo $number | sed 's/./& /g' | tr ' ' '\n' | sort`
    number6=`echo "(($number*6)-2)" | bc`
    [ ${#number} -lt ${#number6} ] && let number=$number6
    #echo $counter $number

    [ "`echo "$number*2" | bc | sed 's/./& /g' | tr ' ' '\n' | sort`" == "$digits_list" ] && echo found 2x $number && \
    [ "`echo "$number*3" | bc | sed 's/./& /g' | tr ' ' '\n' | sort`" == "$digits_list" ] && echo found 3x $number && \
    [ "`echo "$number*4" | bc | sed 's/./& /g' | tr ' ' '\n' | sort`" == "$digits_list" ] && echo found 4x $number && \
    [ "`echo "$number*5" | bc | sed 's/./& /g' | tr ' ' '\n' | sort`" == "$digits_list" ] && echo found 5x $number && \
    [ "`echo "$number*6" | bc | sed 's/./& /g' | tr ' ' '\n' | sort`" == "$digits_list" ] && echo found 6x $number && \
    let found=1 && echo Found: $number

    [ $counter -eq 1000 ] && echo "Checking $number ..." && let counter=0 
    let number++
    let counter++
done
