#!/usr/bin/awk -f 

{

    # part 1

    # res = gsub( /\(/, "", $0 ) - gsub( /\)/, "", $0 )

    str = $0
    res = 0
    for (i = 1; i <= length(str); i++) {
        char = substr(str, i, 1)
        if (char == "(") {
            res += 1
        } else {
            res -= 1
        }
    }

    # part 2

    res2 = -1
    curr = 0
    for (i = 1; i <= length(str); i++) {
        char = substr(str, i, 1)
        curr += (char == "(") ? 1 : -1
        if (curr == -1) {
            res2 = i
            break
        }
    }

    print "part 1: " res
    print "part 2: " res2
}
