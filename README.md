# Curr
<kbd>@ : awk</kbd> \
<kbd>ß : bash</kbd>

▨      |   15  |  16  |  17  |  18  |  19  |  20  |  21  |  22  |  23  |
------ | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
1      |   @ß  |      |      |      |      |      |      |      |      |
2      |   @ß  |      |      |      |      |      |      |      |      |
3      |       |      |      |      |      |      |      |      |      |

# 15-2
we have lines like this (to be sep by 'x'):
> 2x3x4 \
> 1x1x10
```awk
awk -F "x" '{
    # part 1
    D[0] = $1;
    D[1] = $2;
    D[2] = $3;
    for (i = 0; i < 2; i++) {
        for (j = i + 1; j < 3; j++) {
            if (D[i] > D[j]) {
                temp = D[i];
                D[i] = D[j];
                D[j] = temp;
            }
        }
    }
    res += 2 * D[1] * D[2] + 2 * D[1] * D[0] + 2 * D[2] * D[0] + D[0] * D[1];
    # part 2
    bow = $1 * $2 * $3;
    wrap = (D[0] + D[1]) * 2
    res2 += wrap + bow
} END { \
    print "part 1: " res ;
    print "par2 2: " res2; 
}' 02.0
```
```bash
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
```

# 15-1
we have one long string: 
> )())())
```awk
awk '{
    str = $0 # READ one long string
    res = 0
    for (i = 1; i <= length(str); i++) { # strlen: length(str)
        char = substr(str, i, 1)
        if (char == "(") {
            res += 1
        } else {
            res -= 1
        }
    }
    print "part 1: " res
}' input.in
```
```bash
#!/bin/sh

IFS= read -r line # READ one long string w/o sep "IFS=" and ended w/ a carriage return
echo "$line" 
echo "len: ${#line}" # use '#' to get strlen 
L=$(echo "$line" | grep -o "(" | wc -l)
R=$(echo "$line" | grep -o ")" | wc -l)
res=$((L-R))
echo "part 1: $res"
```
