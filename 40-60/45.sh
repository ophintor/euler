#!/bin/bash

export BC_LINE_LENGTH=0
filetri=/tmp/45tri.txt
cat /dev/null > $filetri

target=40755
n=1

while true; do
    tn=`echo "(($n*($n+1))/2)" | bc`
    pn=`echo "(($n*((3*$n)-1))/2) " | bc`
    hn=`echo "($n*((2*$n)-1))" | bc`
    echo $tn >> $filetri
    echo $pn >> $filetri
    echo $hn >> $filetri
    [ $tn -gt $target ] && [ `grep "^$tn$" $filetri | wc -l` -eq 3 ] && echo Result: $tn && break
    let n++
done
