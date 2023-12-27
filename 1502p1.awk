awk -F "x" \
    '{
        D[1] = $1;
        D[2] = $2;
        D[3] = $3;
        for (i = 1; i < 3; i++) {
            for (j = i + 1; j < 4; j++) {
                if (D[i] > D[j]) {
                    temp = D[i];
                    D[i] = D[j];
                    D[j] = temp;
                }
            }
        }
        res += 2 * D[1] * D[2] + 2 * D[1] * D[3] + 2 * D[2] * D[3] + D[1] * D[2];
    } \
    END {
        print res;
    }' 02.0

