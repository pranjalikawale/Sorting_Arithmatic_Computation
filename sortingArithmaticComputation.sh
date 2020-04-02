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
   declare -A result
   result[" $a+$b*$c "]=$(addMultiply $a $b $c)
   result[" $a*$b+$c "]=$(multiplyAdd $a $b $c)
   result[" $c+$a/$b "]=$(addDivide $a $b $c)
   result[" $a%$b+$c "]=$(modAdd $a $b $c)
   createArray "${result[@]}"
}

function createArray()
{
   count=0
   for val in "${@}"
   do
      resultArray[((count++))]=$val
   done
   sorting "${resultArray[@]}"
}

function sorting()
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
         ascending[${#array[@]}-$i]=${array[$i]}
   done
         ascending[${#array[@]}-$i]=${array[$i]}
   echo "Sort the reasult in decending order: " ${array[@]}
   echo "Sort the reasult in ascending order: " ${ascending[@]}
}

read -p "Enter the three input: " a b c
evaluateOperation $a $b $c

