#!/bin/sh

IFS= read -r line

echo "$line"
L=$(echo "$line" | grep -o "(" | wc -l)
R=$(echo "$line" | grep -o ")" | wc -l)
res=$((L-R))

echo "$res"
