let hd = function
    [] -> raise(Failure "hd")
    | h :: _ -> h
;;

let tl = function
    [] -> raise(Failure "tl")
    | h :: [] -> []
    | h :: t -> t
;;

let length list =
    if list = [] then raise(Failure "length")
    else(
    let rec aux_length list n = match list with
        | [] -> n
        | h :: t -> aux_length t (n+1)
    in aux_length list 0
    )
;;

let rec compare_length list1 list2 = match (list1, list2) with
    [],[] -> 0
    |[],_ -> -1
    |_,[] -> 1
    |h1::t1,h2::t2 -> compare_length t1 t2
;;

let rec nth n list =
    if n < 0 then raise(Failure : "n < 0")
    else (
        if n = 0 then (hd list)
        else nth (n-1) (tl list)
    )
;;

let rec append list1 list2 = match list1  with
    [] -> list2
    | h :: t -> h :: append t list2
;;

let rec for_all f list = 
    if list = [] then true
    else (
        if f (hd list) = false then false
        else for_all f (tl list)
    )
;;

let rec exists f list = 
    if list = [] then false
    else (
        if f (hd list) = true then true
        else exists f (tl list)
    )
;;

let rec mem a list = 
    if list = [] then false
    else(
        if (hd list) = a then true
        else mem a (tl list)
    )
;;

let filter f list =
    let rec auxfilter f list r_list = match list with
        [] -> r_list
        | h :: t -> if (f h) then auxfilter f t ( h :: r_list)
                    else auxfilter f t r_list
    in auxfilter f (rev list) []
;;

let rec find_all f list =
    let rec auxfilter f list r_list = match list with 
        [] -> r_list     
        | h :: t -> if (f h) then auxfilter f t ( h :: r_list) 
                    else auxfilter f t r_list 
    in auxfilter f (rev list) []
;;

let partition f list = 
    let rec aux_part f list t_list f_list = match list with
        [] -> ((rev t_list), (rev f_list))
        | h :: t -> if f (h) then aux_part f t (h::t_list) f_list
                    else aux_part f t t_list (h::f_list)
    in aux_part f list [] []
;;


let rec split = function
    [] -> ([],[])
    |(h1,h2) :: t -> let (t1,t2) = split t in (h1::t1,h2::t2)
;;

let rec combine list1 list2 = match (list1, list2) with
  ([], []) -> []
  | (h1::t1, h2::t2) -> (h1, h2)::combine t1 t2
  | (_, _) -> raise(Invalid_argument"combine")
;;

let init n f =
    if n < 0 then raise (Invalid_argument "length < 0")
    else (
        let rec aux_init n x list =
            if x = n then list
            else aux_init n (x+1) ((f x)::list)
        in aux_init n 0 []
    )
;;

let rec rev list =
    let rec auxrec r = function
        [] -> [] 
        |h::t -> auxrec (h::r) t
in
    auxrec [] list
;;

let rev_append list1 list2 = match list1 with
    [] -> list2
    | h :: t -> rev_append t (h::list)
;;

let rec concat = function
    [] -> []
    |h::t -> append h (concat t);;
;;

let flatten = concat;;

let rec map f list = match list with
    [] -> []
    | h :: t -> f (h)::map f t
;;

let rec map2 f list1 list2 =
    if(length list1 <> length list2) then raise (Invalid_argument"map2")
    else if (length list1 == 0) then []
    else (f(hd list1)(hd list2))::map2 f (tl list1)(tl list2)
;;

let rec fold_right f list i = match list with
    [] -> i
    |h :: t -> f h (fold_right f t i)
;;

let rec fold_left f i list = match list with
    [] -> i
    |h :: t -> fold_left f (f i h) t
;;

