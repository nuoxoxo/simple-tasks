#!/bin/bash

IFS= read -r line
r=0
c=0
seen=()

for (( i = 0; i < ${#line}; i++ )); do

    char="${line:i:1}"
    [[ $char == "^" ]] && ((r--))
    [[ $char == ">" ]] && ((c++))
    [[ $char == "v" ]] && ((r++))
    [[ $char == "<" ]] && ((c--))

    target="$r,$c"
    [[ ! " ${seen[@]} " =~ " $target " ]] && seen+=("$target")

done

echo "part 1: ${#seen[@]}"
