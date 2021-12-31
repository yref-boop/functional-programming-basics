let rec mcd x y =
    if (y = 0) then x
    else( 
        if (x = y) then x
        else mcd y (x mod y)
    )
;;

