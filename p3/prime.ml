let is_prime n =
    let rec check_from i =
        i >= n || (n mod i <> 0 && check_from (i+1))
    in check_from 2
;;

let next_prime n = 
    if is_prime (n+1) then n+1
    else next_prime (n+1)
;;

let last_prime n =
    if is_prime n then n
    else last_prime (n-1)
;;

let rec is_prime2 n =
    if(n mod 2 == 0 || n mod 3 == 0 || n mod 5 == 0 || n mod 7 == 0) then true
        else(
        let rec check_from i =
            (float_of_int(i)<= sqrt(float_of_int(n))) ||
            (n mod i <> 0 && check_from (i+1))
                in check_from 2)
;;

