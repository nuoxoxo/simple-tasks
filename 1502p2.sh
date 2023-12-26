#!/bin/bash

res=0
while IFS= read -r line; do
    echo "$line"
    # echo "$line" | IFS="x" read -ra D # wrong bc. pipeline sends us to a subshell
    IFS="x" read -ra D <<< "$line"
    l="${D[0]}"
    w="${D[1]}"
    h="${D[2]}"
    ### way 1 naive : subshell operations are slow
    # sorted=($(for n in "${D[@]}"; do echo "$n"; done | sort -n))
    # side=$((${sorted[0]}*${sorted[1]}))
    ### way 2 : avoid sorting
    min1=$l
    min2=$w
    if [ "$w" -lt "$l" ]; then
        min1=$w
        min2=$l
    fi
    if [ "$h" -lt "$min1" ]; then
        min2=$min1
        min1=$h
    elif [ "$h" -lt "$min2" ]; then
        min2=$h
    fi
    side=$(($min1*$min2))
    temp=$((2*$l*$w + 2*$w*$h + 2*$h*$l + $side))
    res=$(($temp+$res))
done

echo "part 1: $res"
