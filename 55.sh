#!/bin/bash

export BC_LINE_LENGTH=0

function error {
    echo "Incorrect number of parameters, expecting number"
    exit 1
}

[ "$#" -eq 1 ] || error

max=$1
result=0

function get_reverse {
onumber=$1
rnumber=""
for (( z=0;z<${#onumber};z++ )); do
    rnumber=${onumber:$z:1}${rnumber}
done
}


function is_palindrome {
word=$1
if [ ${#word} -le 1 ]; then
    palindrome=1
elif [ ${word:0:1} -eq ${word: -1} ]; then
    is_palindrome ${word:1:-1}
else
    palindrome=0
fi
}


function is_lychrel {
number=$1
lychrel=0
n=50
while [ $n -gt 0 ];do
   get_reverse $number
   number=`echo "$number+$rnumber" | bc`
   is_palindrome $number
   if [ $palindrome -eq 1 ]; then
       let lychrel=1
       break
   fi
   let n--
done
}


for (( i=1;i<=$max;i++ )); do
    is_lychrel $i
    if [ $lychrel -eq 0 ];then
         echo "$i appears to be a Lychrel number!"
         let result++
    fi
done
echo Solution: there are $result Lychrel numbers under $max
