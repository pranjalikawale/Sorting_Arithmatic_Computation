#!/bin/bash -x

read -p "Enter the three input: " a b c

declare -A result

result[" $a+$b*$c "]=$((a+b*c))
result[" $a*$b+$c "]=$((a*b+c))
result[" $c+$a/$b "]=$((c+a/b))
result[" $a%$b+$c "]=`awk "BEGIN {print $a%$b+$c }"`

count=0

echo "Expression "${!result[@]}

for a in ${result[@]}
do
	resArray[((count++))]=$a
done

echo "Result "${resArray[@]}
