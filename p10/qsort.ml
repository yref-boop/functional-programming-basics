
let rec qsort1 ord = function
    [] -> []
    | h :: t -> let after, before = List.partition (ord h) t in
                qsort1 ord before @ h :: qsort1 ord after
;;

(*el rendimiento de esta implementacion será menor para aquellos casos en los que la lista esté desbalanceada*)

let rec qsort2 ord =
    let append' l1 l2 = List.rev_append (List.rev l1) l2 in 
        function
            [] -> []
            | h :: t -> let after, before = List.partition (ord h) t in
                        append' (qsort2 ord before) (h :: qsort2 ord after)
;;

(*la ventaja es que la segunda implementación usa funciones terminales, 
lo cual conlleva, generalmente, a mayor eficiencia, y que es posible ordenar listas mayores, ya que la no-recursividad tiende a agotar el stack relativamente rápido*)

let init n f =
    let rec aux_init (i, list) =
        if i = n then list
        else aux_init (i + 1, f i::list)
    in List.rev( aux_init (0, []))
;;

let l1 = init 600000 (function x -> Random.int 1000);;

(*en este caso, qsort2 es más lento que qsort1*)


let rec divide l = match l with 
    h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
    | _ -> l []
;;

let rec merge = function
    [], l | [] -> l
    | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                        else h2 :: merge (h1::t1,t2)
;;

let rec msort1 l = match l with
    [] | _::[] -> l
    |  _ -> let l1, l2 = divide l 
            in merge(msort1 l1, msort1 l2)
;;

(*si, de nuevo, es posible que se produzca un stak overflow devido a la no-recursividad*)

let l2 = init 600000 (function x -> Random.int 1000);;

let divide' l =
    let rec aux dvd1 dvd2 = function
        [] -> (List.rev dvd1, List.rev dvd2)
        | h::[] -> (List.rev (h::dvd1), List.rev dvd2)
        | h1::h2::t -> aux (h1::dvd1) (h2::dvd2) t
    in aux [] [] l
;;

let merge' ord (l1, l2) =
    let rec aux (a1, a2) mer = match a1, a2 with
        [], l | l, [] -> List.rev_append mer l
        | h1::t1, h2::t2 -> if ord h1 h2 then aux (t1, h2::t2) (h1::mer)
                            else aux (h1::t1, t2) (h2::mer)
in aux (l1, l2) []
;;

let rec msort2 ord l = match l with
    [] | _::[] -> l
    | _ -> let l1, l2 = divide' l
in merge' ord (msort2 ord l1, msort2 ord l2)
;;

(*msort2 es ligeramente mas lento que msort1, y ambos son más rápidos que qsort2*)
