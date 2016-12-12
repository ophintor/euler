#!/bin/bash

export BC_LINE_LENGTH=0

echo Result: `echo "2^1000" | bc | sed 's/./&+/g' | sed 's/+$//' | bc` 
