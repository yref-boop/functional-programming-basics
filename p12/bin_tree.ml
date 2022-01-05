type 'a bin_tree = 
    Empty
    | Node of 'a * 'a bin_tree * 'a bin_tree
;;

let rec fold_tree f a = function
    Empty -> a
    | Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r)
;;

let sum t = match t with
    Empty -> 0
    | Node (x, l, r) ->
        let f x l r = x + l + r
        in fold_tree f 0 t
;;

let prod t = match t with
    Empty -> 0.
    |Node (x, l, r) ->
        let f x l r = x *. l *. r
        in fold_tree f 1. t
;;

let size t = match t with
    Empty -> 0
    |Node (x, l, r) ->
        fold_tree (fun c _ -> c + 1) 0 t
;;

let inorder t = match t with
    Empty -> []
    |Node (x, l, r) ->
        let  f x l r = x l r
        in fold_tree f [] t 
;;

let mirror = 
;;
