let f n =
    if n mod 2 = 0 then n / 2
    else 3 * n + 1
;;

let rec orbit n =
    if n = 1 then print_endline("1")
    else(print_int n;print_string(", "); orbit(f n))
;;

let rec length n =
    if n = 1 then 0
    else 1 + length (f n)
;;

let top n =
    if n = 1 then 1
    else(
        let rec aux x y =
            if x = 1 then y
            else (
                if x < y then aux (f x) y
                else aux (f x) x
            )
        in aux n (f n)
    )
;;

let length'n'top n = 
    if n = 1 then (0, 1)
    else(
        let rec aux x y z =
            if x = 1 then (y, z)
            else (
                if x < z then aux (f x) (y+1) z
                else aux (f x) (y+1) z
            )
        in aux n 0 (f n)
    )
;;


(*opcionales*)


(**)
let rec longest_in n m =
    if m < n then -1
    else( 
        let rec aux x y z =
            if x = y then z
            else(
                if (length x) < (length y) then (
                    if length y < length z then aux x (y-1) z
                    else aux x (y-1) y
                )
                else(
                    if length x < length z then aux x (y-1) z
                    else aux x (y-1) x
                )
            )
        in aux n m n    
    )
;;

let rec highest_in n m =
        if m < n then -1
    else(           
        let rec aux x y z =
            if x = y then z
            else(
                if (top x) < (top y) then (      
                    if top y < top z then aux x (y-1) z
                    else aux x (y-1) y
                )
                else(             
                    if top x < top z then aux x (y-1) z
                    else aux x (y-1) x    
                )
            )
        in aux n m n    
    )    
;;

