(*CREATE TERMINAL RECURSION FUNCTIONS*)


(*let rec to0from n =
    if n < 0 then []
    else n :: to0from (n-1)
;;*)

let to0from n =
    if n < 0 then []
    else(
        let rec aux_to0 n' list =
            if n' < 0 then List.rev list
            else aux_to0 (n'-1) (n'::list) 
        in aux_to0 n []
    )
;;


(*let rec fromto m n =
    if m > n then []
    else m :: fromto (m + 1) n
;;*)

let fromto m n =
    if m > n then []
    else (
        let rec aux_fromto m' list =
            if m' > n then List.rev list
            else aux_fromto (m' + 1) (m'::list)
        in aux_fromto m []
    )
;;


(*let rec from1to n =
    if n < 1 then []
    else from1tio (n-1) @ [n]
;;*)

let from1to n = fromto 1 n;;


(*let map =
    List.map
;;*)

let rec map f list = match list with
    [] -> []
    | h :: t -> f(h) :: map f t
;;


(*let power x y =
    let rec innerpower x y =
        if y = 0 then 1
        else x * innerpower x (y-1)
    in
        if y >= 0 then innerpower x  y
        else invalid_arg "power"
;;*)

let power x y =
    let rec innerpower x y list =
        if y = 0 then List.fold_left ( * ) 1 list
        else innerpower x (y-1) (x::list)
    in
        if y >= 0 then innerpower x y [1]
        else invalid_arg "power"
;;


(*let incseg l =
    List.fold_right (fun x t -> x::List.map ((+) x) t) l []
;;*)

let incseg l =
    let rec aux_incseg l n list = match l with
        [] -> []
        | [h] -> List.rev ((h + n)::list)
        | h :: t -> aux_incseg t (h + n) ((h + n)::list)
    in aux_incseg l 0 []
;;


(*let rec remove x = function
    [] -> []
    | h :: t -> if x = h then t
                else h :: remove x t
;;*)

let remove x l =
    let rec aux_remove x o_list r_list = match o_list with
        [] -> []
        | h :: t ->
                if h = x then List.rev_append r_list t
                else aux_remove x t (h::r_list) 
    in aux_remove x l []
;;
    

(*let rec divide = function
    | h1::h2::t -> 
        let  l1, l2 = divide t
        in h1::l1,h2::l2
    | l -> l, []
;;*)

let divide l =
    let rec aux_divide list odd_list even_list = match list with
        | h1::h2::t -> aux_divide t (h1::odd_list) (h2::even_list) 
        | h::[] -> (List.rev(h::odd_list), List.rev(even_list))
    in aux_divide l [] []
;;


(*let rec compress = function
    | h1::h2::t -> if h1 = h2 then compress (h2::t)
                   else h1 :: compress (h2::t)
    | l -> l
;;*)

let compress l = 
    let rec aux_compress list r_list = match list with
        | [] -> List.rev(r_list)
        | h1::h2::t -> 
            if h1=h2 then aux_compress (h2::t) (r_list)
            else aux_compress (h2::t) (h1::r_list)
        | h1::[] -> List.rev(h1::r_list)
    in aux_compress l []
;;

