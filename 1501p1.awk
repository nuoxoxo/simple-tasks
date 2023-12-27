awk '{

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
    print "part 1: " res
}' 01.0
