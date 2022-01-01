let hd = function
    h :: _ -> h
    |_ -> raise(Failure "hd")
;;

let tl = function
    h :: [] -> []
    |_ :: t -> t
;;

let tl = function    
    h :: [] -> []
    |_ :: t -> t   
;;

let rec length = function
    h :: [] -> 1
    |_ :: t -> 1 + length t
;;

let compare_lengths list1 list2 =
    (length list1) - (length list2)
;;

let rec nth n list =
    if n = 0 then (hd list)
    else nth (n-1) list
;;

let rec append list1 list2 = match list1 with
    [] -> list2
    | h :: t -> h :: append t list2
;;

let rec find a list = 
    if (hd list) = a then hd list
    else find a (tl list)
;;

let rec for_all f = function
    h :: [] -> (f h)
    |h :: t -> (f h) && (for_all f t) 
;;

let rec exists f = function
    h :: [] -> (f h)
    |h :: t -> (f h) || (for_all f t)
;;

let rec mem a list = match list with
    h :: t -> a == h || mem a t
;;

let filter f list =
    let rec filter_aux f list r_list = 
        if (hd list) = [] then r_list
        else(
            if (f (hd list)) then filter_aux f (tl list) (append (hd list) r_list)
            else filter_aux f (tl list) r_list
        )
    in filter_aux f list []
;;

let rec find_all f list = 
        let rec filter_aux f list r_list =
        if (hd list) = [] then r_list
        else(
            if (f (hd list)) then filter_aux f (tl list) (append (hd list) r_list)
            else filter_aux f (tl list) r_list
        )   
    in filter_aux f list []
;;

let partition f list =
    let rec partition_aux f list list1 list2 =
        if (hd list) = [] then (list1, list2)
        else(
            if (f (hd list)) then partition_aux f (tl list) (append (hd list) list1) list2
            else partition_aux f (tl list) list1 (append (hd list) list2)
        )   
    in partition_aux f list [] []
;;

let rec split = function
    (h1,h2) :: t -> let (l1, l2) = split t in  (h1::l1, h2::l2)
;;

let rec combine = function 
    (h1::l1, h2::l2) -> (h1,h2)::combine t1 t2
;;

let init n f =
    let rec aux_init n x f list =
        if x = n then list
        else aux_init n (x+1) f ((f x)::list)
    in aux_init n 0 f []
;;

let rev list =
    let rec aux_rev list1 list2 = match list1 with
        [] -> list2
        | h :: t -> aux_rev t (append h list2) 
    in aux_rev list []
;;

let rec rev_append list1 list2 =
    append (rev list1) list2
;;

let rec concat = function
    h :: t -> append h (concat t)
;;

let rec flatten list = concat;;

let rec map f list = match list with
    h :: t -> (f h) :: map f t
;;

let rec rev_map f list 

let rec map2

let rec fold_right

let rec fold_left
