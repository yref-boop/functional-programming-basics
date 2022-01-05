
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

(*en este caso, qsort2 es bastante más lento que qsort1*)
