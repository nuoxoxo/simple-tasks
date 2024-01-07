awk '{

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
    }
} END {
    print "part 1: " res
} ' 03.0
