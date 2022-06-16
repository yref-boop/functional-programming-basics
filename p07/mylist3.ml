let rec remove a = function
    [] -> []
    | h :: t -> if a = h then t
                else remove a t
;;

let rec remove_all a = function
    [] -> []
    | h :: t -> if a = h then remove_all n t 
                else h :: (remove_all n t)
;;

let rec ldif list1 list2 = match list2 with
    [] -> list1
    | h :: t -> ldif (remove_all h list1) t
;;

let rec lprod list1 list2 = match list1 with
    [] -> []
    | h :: t -> 
        let rec aux_prod h1 list2 = match list2 with
        [] -> []
        | h :: t -> (h1, h)::(aux_prod h1 t)
    in List.append (aux  h list2) (lprod t l2)
;;

let rec divide = function
    h1 :: h2 :: t ->
        let list1, list2 = 
            divide t
        in h1::list1, h2::list2
    | l -> l, []
;;
