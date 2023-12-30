#!/bin/bash

#part1=0

while IFS= read -r line; do

    vowels=0
    cond1=0
    cond2=0
    cond3=1

    for ((i = 0; i < ${#line}; i++)); do

        char="${line:i:1}"
        [[ $char =~ [aeiou] ]] && (( vowels++ ))

        # part 1 - condition 2/3 : check any 'aa'-like pair
        pair="${line:i:2}"
        [[ "${pair:0:1}" == "${pair:1:1}" ]] && (( cond2 = 1 ))

    done

    # part 1 - condition 1/3 : at least 3 vowels
    (( vowels > 2 )) && (( cond1 = 1 ))

    # part 1 - condition 3/3 : check none from this group exists
    [[ "$line" =~ ab|cd|pq|xy ]] && (( cond3 = 0 ))

    (( cond1 + cond2 + cond3 == 3 )) && (( part1++ ))

done

echo "part 1: $part1"

