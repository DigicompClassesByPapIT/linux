#!/bin/sh


fibo() {
    n=$1
    if [ "$n" -lt 2 ]; then
        echo "$n"
        return
    fi

    val1=$(fibo $((n - 1)))
    val2=$(fibo $((n - 2)))

    val=$((val1 + val2))

    echo "$val"
}

fibo "$1"