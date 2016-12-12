#!/bin/bash

FILE=11-grid.txt
TEMPFILE=/tmp/grid.txt
LINES=`cat $FILE | wc -l`
COLUMNS=`cat 11-grid.txt | awk -F' ' '{ print NF }' | tail -1`
FACTORS=4
LINELIMIT=$(( LINES-FACTORS+1 ))
COLLIMIT=$(( COLUMNS-FACTORS+1 ))
LARGEPROD=0

cat 11-grid.txt | awk -F' ' '{ print ":" NR ": " $0 }' > $TEMPFILE

for (( i=1; i<=LINES; i++ )); do
    for (( j=1; j<=COLUMNS; j++ )); do
        # HORIZONTAL
        if [[ j -le $LINELIMIT ]]; then
            LINEPROD=`grep ":${i}:" $TEMPFILE | awk -F' ' -v a="$(( j+1 ))" -v b="$(( j+2 ))" -v c="$(( j+3 ))" -v d="$(( j+4 ))" \
                 '{ print $a"*"$b"*"$c"*"$d }' | bc`
            if [[ $LINEPROD -gt $LARGEPROD ]]; then
                LARGEPROD=$LINEPROD
                echo New larger product found: $LARGEPROD - horizontal [$i,$j]
            fi
        fi
        # VERTICAL
        if [[ i -le $COLLIMIT ]]; then
            COLPROD=`grep -A $(( FACTORS-1 )) ":${i}:" $TEMPFILE | awk -F' ' -v a="$(( j+1 ))" '{ print $a }'`
            COLPROD=` echo $COLPROD | tr ' ' '*' | bc`
            if [[ $COLPROD -gt $LARGEPROD ]]; then
                LARGEPROD=$COLPROD
                echo New larger product found: $LARGEPROD - vertical [$i,$j]
            fi
        fi
        # DIAGONAL DOWN LEFT
        if [[ j -le $LINELIMIT ]] && [[ i -le $COLLIMIT ]]; then
            F1=`grep ":${i}:"       $TEMPFILE | awk -F' ' -v a="$(( j+1 ))" '{ print $a }'`
            F2=`grep ":$(( i+1 )):" $TEMPFILE | awk -F' ' -v a="$(( j+2 ))" '{ print $a }'`
            F3=`grep ":$(( i+2 )):" $TEMPFILE | awk -F' ' -v a="$(( j+3 ))" '{ print $a }'`
            F4=`grep ":$(( i+3 )):" $TEMPFILE | awk -F' ' -v a="$(( j+4 ))" '{ print $a }'`
            DIAGPROD=`echo ${F1}*${F2}*${F3}*${F4} | bc`
            if [[ $DIAGPROD -gt $LARGEPROD ]]; then
                LARGEPROD=$DIAGPROD
                echo New larger product found: $LARGEPROD - diagonal down right [$i,$j]
            fi
        fi
        # DIAGONAL DOWN RIGHT
        if [[ j -le $LINELIMIT ]] && [[ i -le $COLLIMIT ]]; then
            F1=`grep ":${i}:"       $TEMPFILE | awk -F' ' -v a="$(( j+4 ))" '{ print $a }'`
            F2=`grep ":$(( i+1 )):" $TEMPFILE | awk -F' ' -v a="$(( j+3 ))" '{ print $a }'`
            F3=`grep ":$(( i+2 )):" $TEMPFILE | awk -F' ' -v a="$(( j+2 ))" '{ print $a }'`
            F4=`grep ":$(( i+3 )):" $TEMPFILE | awk -F' ' -v a="$(( j+1 ))" '{ print $a }'`
            DIAGPROD=`echo ${F1}*${F2}*${F3}*${F4} | bc`
            if [[ $DIAGPROD -gt $LARGEPROD ]]; then
                LARGEPROD=$DIAGPROD
                echo New larger product found: $LARGEPROD - diagonal down left [$i,$j]
            fi
        fi
   done
done

echo Result: $LARGEPROD
