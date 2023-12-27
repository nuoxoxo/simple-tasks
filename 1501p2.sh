#!/bin/sh

IFS= read -r line

echo "$line"
echo "len: ${#line}"

P=0
res=-1

for ((i = 0; i < ${#line}; i++)); do
    char="${line:$i:1}"
    [ "$char" = "(" ] && P=$((P + 1)) || P=$((P - 1))
    [ $P -eq -1 ] && { res=$((i + 1)); break; }
done

echo "part 2: $res"
