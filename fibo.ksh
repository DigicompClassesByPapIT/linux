#!/usr/bin/ksh
# The code is broken to use ShellCheck to fix
# Kind of a mistery, this one is faster than the cached version
fibo() {
    typeset n=$1
    if (( n < 2 )); then
        echo $n
        return
    fi

    typeset val1=$(fibo $((n - 1)))
    typeset val2=$(fibo $((n - 2)))

    typeset val=$((valeur1 + valeur2))

    echo "$val"
}

fibo "$1"