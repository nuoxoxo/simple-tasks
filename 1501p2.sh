#!/bin/sh

IFS= read -r line

echo "$line"
echo "len: ${#line}"

P=0
res=-1

for ((i = 0; i < ${#line}; i++)); do
    char="${line:$i:1}"
    if [ "$char" = "(" ]; then
        P=$((P + 1))
    else
        P=$((P - 1))
    fi
    if [ $P -eq -1 ]; then
        res=$((i + 1))
        break
    fi
done

echo "part 2: $res"
