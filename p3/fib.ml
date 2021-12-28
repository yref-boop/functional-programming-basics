(*given function*)

let rec fib_n n =
    if n <= 1 then n
    else fib_n (n-1) + fib_n (n-2);;

let rec fib n =
    if n = 0 then print_endline ("0")
    else fib(n-1); print_endline (string_of_int(fib_n n));;
