#!/bin/bash -x

read -p "Enter the three input: " a b c

echo "Result of ( $c + $a / $b ) is" 
awk "BEGIN {print $c+$a/$b }"
