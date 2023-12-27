awk '{
    res = gsub( /\(/, "", $0 ) - gsub( /\)/, "", $0 )
    print "part 1: " res
}' 01.0
