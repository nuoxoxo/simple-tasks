#!/usr/bin/awk -f 

{
    r = 0; c = 0
    for (i = 1; i <= length($0); i++) {

        move = index("v^><", substr($0, i, 1))
        r += (move == 1)
        r -= (move == 2)
        c += (move == 3)
        c -= (move == 4)
        target = r "," c
        seen[target] = 1
    }

    res += length(seen)
    delete seen

    # part 2

    r = 0; c = 0; rr = 0; cc = 0
    for (i = 1; i <= length($0) - 1; i += 2) {

        move = index("v^><", substr($0, i, 1))
        r += (move == 1)
        r -= (move == 2)
        c += (move == 3)
        c -= (move == 4)
        target = r "," c
        seen [target] = 1

        move = index("v^><", substr($0, i + 1, 1))
        rr += (move == 1)
        rr -= (move == 2)
        cc += (move == 3);
        cc -= (move == 4)
        target = rr "," cc
        seen[target] = 1
    }
    res2 += length(seen)

} END {

    print "part 1:", res
    print "part 2:", res2
}

# original soln

0 {

    r = 0
    c = 0
    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1)
        if (char == "^") {
            r -= 1
        } else if (char == ">") {
            c += 1
        } else if (char == "v") {
            r += 1
        } else if (char == "<") {
            c -= 1
        }
        target = r "," c
        # check if target in a set
        # if yes, do nothing
        # else, add target to set
        if ( ! (target in seen)) {
            seen[target] = 1
        }
    }
    res = 0
    for ( loc in seen ) {
        res += 1
        delete seen [loc]
    }
    r = 0
    rr = 0
    c = 0
    cc = 0
    for ( i = 1; i <= length($0) - 1; i += 2 ) {
        char = substr($0, i, 1)
        if (char == "^") {
            r -= 1
        } else if (char == ">") {
            c += 1
        } else if (char == "v") {
            r += 1
        } else if (char == "<") {
            c -= 1
        }
        char = substr($0, i + 1, 1)
        if (char == "^") {
            rr -= 1
        } else if (char == ">") {
            cc += 1
        } else if (char == "v") {
            rr += 1
        } else if (char == "<") {
            cc -= 1
        }
        target = r "," c
        if ( ! (target in seen)) {
            seen[target] = 1
        }
        target = rr "," cc
        if ( ! (target in seen)) {
            seen[target] = 1
        }
    }
    res2 = 0
    for ( loc in seen ) {
        res2 += 1
    }
    print "part 1: " res
    print "part 2: " res2

}
