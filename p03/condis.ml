
false && (2 / 0 > 0);;
 (*output esperado*)
  (*bool = false*)
 (*output real:*)
  (*- : bool = false*)

true && (2 / 0 > 0);;
 (*output esperado*)
  (*exception: division by zero*)
 (*output real:*)
  (*Exception: Division_by_zero.*)

true || (2 / 0 > 0);;
 (*output esperado*)
  (*bool = true*)
 (*output real:*)
  (*- : bool = true*)

false || (2 / 0 > 0);;
 (*output esperado*)
  (*exception: division by zero*)
 (*output real:*)
  (*Exception: Division_by_zero.*)


let con b1 b2 = b1 && b2;;
 (*output esperado*)
  (*val con = bool -> bool -> bool = fun*)
 (*output real:*)
  (*val con : bool -> bool -> bool = <fun>*)


let dis b1 b2 = b1 || b2;;
 (*output esperado*)
  (*val con = bool -> bool -> bool = fun*)
 (*output real:*)
  (*val con : bool -> bool -> bool = <fun>*)

con (1 < 0) (2 / 0 > 0);;
 (*output esperado*)
  (*exception: division by zero*)
 (*output real:*)
  (*Exception: Division_by_zero*)

(1 < 0) && (2 / 0 > 0);;
 (*output esperado*)
  (*bool = false*)
 (*output real:*)
  (*- : bool = false*)

dis (1 > 0) (2 / 0 > 0);;
 (*output esperado*)
  (*exception: division by zero*)
 (*output real:*)
  (*Exception: Division_by_zero.
*)

(1 > 0) || (2 / 0 > 0);;
 (*output esperado*)
  (*bool = true*)
 (*output real:*)
  (*- : bool = true*)
