<details><summary>Notes 2O15</summary>

# Curr

▨      |  5  | 6 | 7 | 8 | 9 | 0 | 1 | 2 | 3 |
------ | --- | - | - | - | - | - | - | - | - |
1      | @ß  |   |   |   |   |   |   |   |   |
2      | @ß  |   |   |   |   |   |   |   |   |
3      | @   |   |   |   |   |   |   |   |   |
4      | ¢   |   |   |   |   |   |   |   |   |
5      | @   |   |   |   |   |   |   |   |   |

# Running an AWK script
```
$ sh solver.awk < infile
OR
$ awk -f solver.awk < infile
OR
$ chmod +x solver.awk && ./solver.awk < infile 
```

# 2O15 day 5 - Nice 
trivial 

# 2O15 day 4 - MD5
Run:
```
well naturally
$ c++ 1504.cc && ./a.out $(cat infile)
```

# 2O15 day 3 - Houses
we have one single line like:
> ^^<<v<<v><

# 2O15 day 2 - Math
we have a bunch of lines like this (to be sep by 'x'):
> 2x3x4 \
> 1x1x10
```awk
# 1 - awk reads the input line by line, separating each line by a 'x'
# 2 - we get 3 variables ${1|2|3}, assigning them to an array `D`
# 3 - sort the array
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
}' input
```
```bash
# 1 - we read line by line using a while...do loop, `IFS=` means no sep 
# 2 - chop each line w/ `IFS="x"`, sending all elems to an array D `-a D`
# 3 - define a function - we define the func's params w/ keyword `local`

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

# 2O15 day 1 - Lisp
we have one long line: 
> )())())
```awk
# gsub - global substitute will return the total matches which is good enough for p1  

awk '{
    res = gsub( /\(/, "", $0 ) - gsub( /\)/, "", $0 )
    print "part 1: " res
}' 01.0
```
```bash
# for bash grep + wl will give us the total occurrence of a char 

#!/bin/sh

IFS= read -r line # READ one long string w/o sep "IFS=" and ended w/ a carriage return
echo "$line" 
echo "len: ${#line}" # use '#' to get strlen 
L=$(echo "$line" | grep -o "(" | wc -l)
R=$(echo "$line" | grep -o ")" | wc -l)
res=$((L-R))
echo "part 1: $res"
```

</details>
