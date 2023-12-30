#!/bin/bash

regex="(.*) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)"

while IFS= read -r line; do

    [[ "$line" =~ $regex ]]
    # check if line matches (=~), on success
    # all Captured Groups are sent to BASH_REMATCH array

    echo "[0]( group 0 )/ ${BASH_REMATCH[0]}"
    echo "[1]( command )/ ${BASH_REMATCH[1]}"
    echo "[2,3]( sr,sc )/ ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}"
    echo "[4,5]( er,ec )/ ${BASH_REMATCH[4]} ${BASH_REMATCH[4]}"
    echo ""

done

echo "end/"
