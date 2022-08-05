#!/bin/bash

arr1="$(grep 'begin' /Users/vlv/Desktop/exam.log | awk '{print $2}' | grep -o '.\{9\}$')";
arr2="$(grep 'end transaction' /Users/vlv/Desktop/exam.log | awk '{print $2}' | grep -o '.\{9\}$')";

i=0
j=0
k=0
endof=()
beginof=()
answers=()

for word in $arr2
do
    minutes=${word:0:2}
    seconds=${word:3:2}
    mili=${word:6}
    mintosec=$((minutes * 60))
    minplussec=$[$((10#${seconds} + mintosec))]
    ans=$((minplussec * 1000))
    final=$[$((10#${mili} + ans))]

    endof[i]=$final
    i=$((i+1))

done

for word in $arr1
do
    minutess=${word:0:2}
    secondss=${word:3:2}
    milis=${word:6}
    mintosecs=$((minutess * 60))
    minplussecs=$[$((10#${secondss} + mintosecs))]
    anss=$((minplussecs * 1000))
    finals=$[$((10#${milis} + anss))]

    beginof[j]=$finals
    j=$((j+1))

done

len=${#endof[@]}

while [ $k -lt $len ]
do
    f=${endof[k]}
    s=${beginof[k]}
    a=$((f-s))

    answers[k]=$a
    k=$((k + 1))
done

min=${answers[0]}

for i in "${answers[@]}"
do
    (( i < min )) && min=$i
done

# echo "Minimal value is $min"

id="$(grep 'end transaction' /Users/vlv/Desktop/exam.log | awk '{print $8; exit}')"

echo $id