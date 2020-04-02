#!/bin/bash -x

read -p "Enter the three input: " a b c
declare -A result

result[" $a+$b*$c "]=$((a+b*c))
result[" $a*$b+$c "]=$((a*b+c))
result[" $c+$a/$b "]=`awk "BEGIN {print $c+$a/$b }"`
result[" $a%$b+$c "]=`awk "BEGIN {print $a%$b+$c }"`

echo "Expression "${!result[@]}
echo "Result "${result[@]}

