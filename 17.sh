#!/bin/bash

one_to_9=$(( `echo onetwothreefourfivesixseveneightnine | wc -c`-1 ))
ten_to_19=$(( `echo teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen | wc -c`-1 ))
decens=$(( `echo twentythirtyfortyfiftysixtyseventyeightyninety | wc -c`-1 ))
hundred=7
and=3
one_thousand=11

one_to_99=$(( one_to_9+ten_to_19+decens+((decens*9)+(one_to_9*8)) ))
hundreds=$(( one_to_9+(hundred*9) ))

total=$(( one_to_99+hundreds+(99*(one_to_9+((hundred+and)*9)))+(one_to_99*9)+one_thousand ))

echo $total
