#!/bin/bash

res1=$(date +%s.%N)
./$@
res2=$(date +%s.%N)
echo Elapsed: `echo $res2-$res1 | bc`


