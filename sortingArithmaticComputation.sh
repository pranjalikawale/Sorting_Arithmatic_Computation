#!/bin/bash -x

function addMultiply()
{
	echo $(($1+$2*$3))
}

function multiplyAdd()
{
	echo $(($1*$2+$3))
}

function addDivide()
{
	echo `awk "BEGIN {print $3+$1/$2 }"`
}

function modAdd()
{
	echo `awk "BEGIN {print $1%$2+$3 }"`
}

function evaluateOperation()
{
	declare -A resultExpression
	resultExpression[" $a+$b*$c "]=$(addMultiply $a $b $c)
	resultExpression[" $a*$b+$c "]=$(multiplyAdd $a $b $c)
	resultExpression[" $c+$a/$b "]=$(addDivide $a $b $c)
   resultExpression[" $a%$b+$c "]=$(modAdd $a $b $c)
   createArray "${resultExpression[@]}"
}

function createArray()
{
	count=0
	for val in "${@}"
	do
		resultArray[((count++))]=$val
	done
	sortDecending "${resultArray[@]}"
	sortAscending "${resultArray[@]}"
}

function sortDecending()
{
	array=("${@}")
	for ((i=0;i<$((${#array[@]}-1));i++))
	do
		for ((j=$((i+1));j<${#array[@]};j++))
		do
			if [[ ${array[$i]} < ${array[$j]} ]]
			then
				temp=${array[$i]}
				array[$i]=${array[$j]}
				array[$j]=$temp
			fi
		done
	done
	echo "Sort the reasult in decending order: " ${array[@]}
}

function sortAscending()
{
   array=("${@}")
   for ((i=0;i<$((${#array[@]}-1));i++))
   do
      for ((j=$((i+1));j<${#array[@]};j++))
      do
         if [[ ${array[$i]} > ${array[$j]} ]]
         then
            temp=${array[$i]}
            array[$i]=${array[$j]}
            array[$j]=$temp
         fi
      done
   done
  	echo "Sort the reasult in ascending order: " ${array[@]}
}

read -p "Enter the three input: " a b c
evaluateOperation $a $b $c

