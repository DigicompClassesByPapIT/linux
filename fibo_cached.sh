#!/bin/sh

# Workaround for associative array using separate variables
cache_set() {
    eval "cache_$1=$2"
}

cache_get() {
    eval "echo \${cache_$1:-}"
}

fibo_cached() {
    n=$1
    if [ "$n" -lt 2 ]; then
        echo "$n"
        return
    fi

    cached_value=$(cache_get "$n")
    if [ -n "$cached_value" ]; then
        echo "$cached_value"
        return
    fi

    val1=$(fibo_cached $((n - 1)))
    val2=$(fibo_cached $((n - 2)))

    val=$((val1 + val2))
    cache_set "$n" "$val"  # Cache the result

    echo "$val"
}

fibo_cached "$1"