#!/bin/bash

maxOf3 () {

    local part=$4
    local a=$1
    local b=$2
    local c=$3
    local res=$a
    if [ $part -eq 2 ]; then # part 2
        if [ $b -gt $res ]; then res=$b; fi
        if [ $c -gt $res ]; then res=$c; fi
    elif [ $part -eq 1 ]; then # part 1
        if [ $b -lt $res ]; then res=$b; fi
        if [ $c -lt $res ]; then res=$c; fi
    fi
    echo $res
}

res1=0
res2=0
while IFS= read -r line; do

    #echo "$line"
    # echo "$line" | IFS="x" read -ra D # wrong bc. pipeline sends us to a subshell
    IFS="x" read -ra D <<< "$line"
    l="${D[0]}"
    w="${D[1]}"
    h="${D[2]}"

    temp=$(maxOf3 $(($l*$w)) $(($w*$h)) $(($h*$l)) 1)
    temp=$(($temp + 2*$l*$w + 2*$w*$h + 2*$h*$l))
    res1=$((res1 + temp))

    wrap=$(( $(($(($w+$l+$h)) - $(maxOf3 $l $w $h 2))) * 2 ))
    bow=$(($w*$l*$h))
    res2=$((res2 + wrap + bow))

done

echo "part 1: $res1"
echo "part 2: $res2"
