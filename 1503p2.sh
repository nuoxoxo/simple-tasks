#!/bin/bash

# part 1

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
part1=${#seen[@]}

echo "part 1: $part1"

# part 2

unset seen
seen=()
r=0
c=0
rr=0
cc=0

for (( i = 0; i < ${#line} - 1; i += 2 )); do

    char="${line:i:1}"
    [[ $char == "^" ]] && ((r--))
    [[ $char == ">" ]] && ((c++))
    [[ $char == "v" ]] && ((r++))
    [[ $char == "<" ]] && ((c--))

    char="${line:i + 1:1}"
    [[ $char == "^" ]] && ((rr--))
    [[ $char == ">" ]] && ((cc++))
    [[ $char == "v" ]] && ((rr++))
    [[ $char == "<" ]] && ((cc--))

    target="$r,$c"
    [[ ! " ${seen[@]} " =~ " $target " ]] && seen+=("$target")
    target="$rr,$cc"
    [[ ! " ${seen[@]} " =~ " $target " ]] && seen+=("$target")

done

echo "part 2: ${#seen[@]}"

