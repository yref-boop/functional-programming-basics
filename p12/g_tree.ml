type 'a g_tree = Gt of 'a * 'a g_tree list


val size : 'a g_tree -> int
(* devuelve el número de nodos de un g_tree *)
    
let rec size = function
    Gt (_,[]) -> 1
    |Gt (r,h::t) -> size h + size (Gt(r, t))
;;


val height : 'a g_tree -> int
(* devuelve la "altura", como número de niveles, de un g_tree *)

let rec height = function
    Gt (_,[]) -> 1
    | Gt (r,h::t) ->  
            let sum = List.fold_left (+) 0 
            in 2 + sum (List.map height t) 
;;


val leaves : 'a g_tree -> 'a list
(* devuelve las hojas de un g_tree, "de izquierda a derecha" *)

let rec leaves = function
    Gt (r,[]) -> [r]
    | Gt (r,h::t) -> leaves h @ leaves (Gt(r,t))
;;

let rec leaves = function                     
    Gt (r,[]) -> [r]               
    | Gt (r,h::t) -> leaves h @ leaves(Gt(r,t))                     
;;



val mirror : 'a g_tree -> 'a g_tree
(* devuelve la imagen especular de un g_tree *)

let rec mirror = function
    Gt(r,[]) -> r
    |Gt(r,h::t) -> mirror(Gt( r, List.rev_append(t [h])))
;;

val preorder : 'a g_tree -> 'a list
(* devuelve la lista de nodos de un g_tree en "preorden" *)

let rec preorder = function
    Gt (r,[]) -> [r]               
    | Gt (r,h::t) -> List.rev(preorder h) @ List.rev(preorder(Gt(r,t)));

val postorder : 'a g_tree -> 'a list
(* devuelve la lista de nodos de un g_tree en "postorden" *)

let rec postorder = function
    Gt (r,[]) -> [r]                         
    | Gt (r,h::t) -> postorder(Gt(r,t)) @ postorder h                     
;;

