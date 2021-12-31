let rec power x y =
    if y=0 then 1
    else x * power x (y-1)
;;

(*las propiedades dadas son coherentes*)

let rec power' x y = 
    if y = 0 then 1
    else(
        if (y mod 2)=0 then power'(x*x) (y/2)
        else x * power' (x*x) (y/2)
    )
;;

(*es esperable que power' sea mas eficiente que power ya que, mientras que power nunca es terminal,
 power' lo es en aproximadamente la mitad de casos*)

let rec powerf x n =
    if n = 0 then 1.
    else (
        if (n mod 2)=0 then powerf(x *. x) (n/2)
        else x *. powerf (x*.x) (n/2)     
    )
;;


