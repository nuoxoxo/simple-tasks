{

    #res = 0
    vowels = 0
    cond1 = 0
    cond2 = 0
    cond3 = 1
    # part 2
    hasPair = 0
    hasABA = 0
    for (i = 1; i <= length($0); i++) {

        char = substr($0, i, 1)
        if ( char ~ /[aeiou]/ ) {
            vowels += 1
        }
        pair = substr($0, i, 2)
        # 2/3 - check letter pair like 'aa'
        if ( substr(pair, 1, 1) == substr(pair, 2, 1) ) {
            cond2 = 1
        }

        # part 2
        if ( hasPair < 1 && i < length($0) - 2 ) {
            rest = substr( $0, i + 2 )
            print pair, rest, index(rest, pair)
            if ( index(rest, pair) > 0 ) {
                hasPair = 1
            }
        }
        if ( hasABA < 1 && i < length($0) - 1 ) {
            L = substr($0, i, 1)
            R = substr($0, i + 2, 1)
            if ( L == R ) {
                hasABA = 1
            }
        }
    }
    # 1/3 - at least 3 vowels
    if ( vowels > 2 ) {
        cond1 = 1
    }
    # 3/3 - check letter pair is one of a group
    if ( $0 ~ /ab|cd|pq|xy/ ) {
        cond3 = 0
    }
    if ( cond1 + cond2 + cond3 == 3 ) {
        res += 1
    }

    # part 2
    if ( hasPair + hasABA == 2 ) {
        res2 += 1
    }

} END {
    print "part 1: " res
    print "part 2: " res2
}
