#!/bin/bash

export BC_LINE_LENGTH=0

fact=`seq -s "*" 1 100 | bc | sed 's/./&+/g'`
echo Result: `echo ${fact:0:-1} | bc`

