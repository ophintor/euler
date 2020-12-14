#!/bin/bash

export BC_LINE_LENGTH=0
tn=1
tn_target=100
file=42-words.txt
filetri=/tmp/42-tri.txt
cat /dev/null > $filetri
result=0

function get_code {
code=$(( `printf '%d\n' "'$1"`-64 ))
}

function get_more_tn {
max=$1
tn=1
n=1
cat /dev/null > $filetri
while [ $tn -lt $max ]; do
    tn=`echo "(($n*($n+1))/2)" | bc`
    echo $tn >> $filetri
    let n++
done
}


# We calculate the first 100 tn
for n in {1..3}; do
    tn=`echo "(($n*($n+1))/2)" | bc`
    echo $tn >> $filetri
done

for w in `cat $file | sed 's/\,/ /g' | sed 's/\"//g'`; do
    word=`echo $w | sed 's/./& /g'`
    wordcode=0
    for letter in $word; do
        get_code $letter
        let wordcode+=$code
    done
    #echo $w $wordcode
    if [ `grep "^$wordcode$" $filetri | wc -l` -eq 1 ]; then
        let result++ 
        echo found $w $wordcode
    elif [ `tail -1 $filetri` -lt $wordcode ]; then
        get_more_tn $wordcode
        [ `grep "^$wordcode$" $filetri | wc -l` -eq 1 ] && let result++ && echo found $w $wordcode
    fi
done
echo Solution: $result words found
