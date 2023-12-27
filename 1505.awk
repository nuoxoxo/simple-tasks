awk '{

    #res = 0
    vowels = 0
    cond1 = 0
    cond2 = 0
    cond3 = 1
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
        # 3/3 - check letter pair is one of a group
        if ( pair ~ /ab|cd|pq|xy/ ) {
            #print pair " 3/3"
            cond3 = 0
        }
    }
    # 1/3 - at least 3 vowels
    if ( vowels > 2 ) {
        cond1 = 1
    }
    if ( cond1 + cond2 + cond3 == 3 ) {
        res += 1
    }
} END {
    print "part 1: " res
}' 05.0
