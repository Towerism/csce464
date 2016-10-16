#!/bin/sh

HOST="$1"

run_hping() { 
    hping3 -d $1 -i u$2 -c 60000 $HOST 2> hping3-outputs/$1.$2.$3.txt 1>/dev/null
}

SIZES="100 1000"
INTERVALS="200 500 1000"

for SIZE in $SIZES; do
    for INTERVAL in $INTERVALS; do
        for i in {1..10}; do
            run_hping $SIZE $INTERVAL $i
            printf "."
        done
    done
done
