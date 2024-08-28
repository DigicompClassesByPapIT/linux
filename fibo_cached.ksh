#!/usr/bin/ksh

typeset -A cache  # Declare an associative array for caching

fibo_cached() {
    typeset n=$1
    if (( n < 2 )); then
        echo "$n"
        return
    fi

    if [[ -n "${cache[$n]}" ]]; then
        echo "${cache[$n]}"
        return
    fi

    typeset val1=$(fibo_cached $((n - 1)))
    typeset val2=$(fibo_cached $((n - 2)))

    typeset val=$((val1 + val2))
    cache[$n]=$val  # Cache the result

    echo "$val"
}

fibo_cached "$1"
