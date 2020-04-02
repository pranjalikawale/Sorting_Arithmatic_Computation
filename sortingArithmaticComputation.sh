#!/bin/bash -x

read -p "Enter the three input: " a b c
declare -A result

result[" $a+$b*$c "]=$((a+b*c))
result[" $a*$b+$c "]=$((a*b+c))
result[" $c+$a/$b "]=`awk "BEGIN {print $c+$a/$b }"`
result[" $a%$b+$c "]=`awk "BEGIN {print $a%$b+$c }"`

echo "Expression "${!result[@]}
function createArray()
{
	count=0
	for a in ${result[@]}
	do
		resArray[((count++))]=$a
	done
	echo "Result "${resArray[@]}
}

createArray "${result[@]}"
