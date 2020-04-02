#!/bin/bash -x

read -p "Enter the three input: " a b c
echo "Result of ( $a % $b + $c ) is" 
awk "BEGIN {print $a%$b+$c }"
