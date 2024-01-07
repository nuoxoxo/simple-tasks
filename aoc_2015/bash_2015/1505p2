#!/bin/bash

part1=0
part2=0

while IFS= read -r line; do

    vowels=0
    cond1=0
    cond2=0
    cond3=1

    # part 2
    hasPair=0
    hasABA=0

    for ((i = 0; i < ${#line}; i++)); do

        char="${line:i:1}"
        [[ $char =~ [aeiou] ]] && (( vowels++ ))

        # part 1 - condition 2/3 : check any 'aa'-like pair
        pair="${line:i:2}"
        [[ "${pair:0:1}" == "${pair:1:1}" ]] && (( cond2 = 1 ))

        # part 2
        (( hasPair < 1 )) && (( i < ${#line} - 1 )) && {
            part1t="${line:i+2}"
            [[ "$part1t" == *"$pair"* ]] && (( hasPair = 1 ))
        }

        (( hasABA < 1 )) && (( i < ${#line} - 2 )) && {
            L="${line:i:1}"
            R="${line:i+2:1}"
            [[ "$L" == "$R" ]] && (( hasABA = 1 ))
        }
    done

    # part 1 - condition 1/3 : at least 3 vowels
    (( vowels > 2 )) && (( cond1 = 1 ))
    # part 1 - condition 3/3 : check none from this group exists
    [[ "$line" =~ ab|cd|pq|xy ]] && (( cond3 = 0 ))

    # both parts
    (( cond1 + cond2 + cond3 == 3 )) && (( part1++ ))
    ((hasPair + hasABA == 2)) && (( part2++ ))

done

echo "part 1: $part1"
echo "part 2: $part2"

