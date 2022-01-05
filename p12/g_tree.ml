type 'a g_tree = Gt of 'a * 'a g_tree list;;


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

let rec leaves =
    let rec f aux_leaves = function
          [] -> aux_leaves
        | h::t -> f (aux_leaves @ leaves h) t
    in function
          Gt (v, []) -> [v]
        | Gt (v, l) -> f [] l
;;


val mirror : 'a g_tree -> 'a g_tree
(* devuelve la imagen especular de un g_tree *)

let rec mirror = function
    Gt(r,[]) -> Gt(r,[])
    |Gt(r,l) -> Gt( r, List.rev(List.map (mirror) l))
;;

val preorder : 'a g_tree -> 'a list
(* devuelve la lista de nodos de un g_tree en "preorden" *)

let rec preorder =
    let rec aux_preorder l = function
          [] -> l
        | h::t -> aux_preorder ( l @ (preorder h) ) t
    in function  
      Gt (v, []) -> [v]
    | Gt (v, l) -> v::bucle [] l
;;                                   

val postorder : 'a g_tree -> 'a list
(* devuelve la lista de nodos de un g_tree en "postorden" *)

let rec postorder = function
    Gt (r,[]) -> [r]                         
    | Gt (r,h::t) -> postorder h @ postorder(Gt(r,t))                   
;;

