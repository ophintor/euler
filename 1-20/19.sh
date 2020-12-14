#!/bin/bash

counter=0

for (( year=1901;year<=2000;year++ )); do
    for (( month=1;month<=12;month++ )); do
        candidate=`date -d "$year-$month-01 1 month" +"%d%m%Y %w" | awk -F' ' '{  print $2 }'`
        [ $candidate -ne 0 ] || let counter++
    done
done

echo There are a total of $counter Sundays that fall on the first of the month in the 20th century
