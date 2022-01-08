let nmem l e =
        not (List.mem e l)
;;

let in_board m n (x,y) =
        x >= 1 && x <= m && y >= 1 && y <= n
;;

let legal_moves m n visited (x,y) =
        let all_moves = [x+1, y+2; x-1, y+2; x+1, y-2; x-1, y-2;
                        x+2, y+1; x+2, y-1; x-2, y+1; x-2,y-1]
        in List.filter (nmem visited) (List.filter(in_board n m) all_moves)
;;


let tour m n (xi,yi) (xf,yf) =
        if (m < 0) || (n < 0) || (not(in_board m n (xf,yf)))
            then raise (Invalid_argument "tour")
        else 
            let rec aux_tour path from =
                if from = (xf,yf) then Some ((xf,yf)::path)
                else
                    let x,y = from 
                    in  
                        if(x > m || y > n || x < 1 || y < 1)  then None
                        else
                            if legal_moves m n path (x,y) = [] then None
                            else let c = 
                                List.map (function x -> aux_tour (from::path) x) (legal_moves m n path from)
                                in
                                    match List.find_opt (function x -> x <> None) c
                                    with
                                        None -> None
                                        | Some x -> x
            in 
                match aux_tour [] (xi,yi)
                with 
                    None -> raise Not_found
                    | Some x -> List.rev x
;;
