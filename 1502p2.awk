awk -F "x" \
    '{
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
          print "part 1: " res "\npar2 2: " res2; 
    }' 02.0
