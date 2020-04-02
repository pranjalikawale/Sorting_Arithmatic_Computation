#!/bin/bash -x

read -p "Enter the three input: " a b c
declare -A result

result[" $a+$b*$c "]=$((a+b*c))
result[" $a*$b+$c "]=$((a*b+c))
result[" $c+$a/$b "]=`awk "BEGIN {print $c+$a/$b }"`
result[" $a%$b+$c "]=`awk "BEGIN {print $a%$b+$c }"`

function createArray()
{
	count=0
	for a in "${@}"
	do
		resArray[((count++))]=$a
	done	
	sorting "${resArray[@]}"
}

function sorting()
{
	arr=("${@}")
	for ((i=0;i<$((${#arr[@]}-1));i++))
	do
		for ((j=$((i+1));j<${#arr[@]};j++))
		do
			if [[ ${arr[$i]} > ${arr[$j]} ]]
			then
				temp=${arr[$i]}
				arr[$i]=${arr[$j]}
				arr[$j]=$temp
			fi
		done
	done
	echo "Sort the reasult in ascending order: " ${arr[@]}
}

createArray "${result[@]}"

