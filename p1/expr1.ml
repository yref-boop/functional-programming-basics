();;
 (*output esperado*)
  (*unit value*)
 (*output real:*)
  (*-: unit ()*)

2+5*3;;
 (*output esperado:*)
  (*int = 17*)
 (*output real:*)
  (*-: int = 17*)

1.0;;
 (*output esperado:*)
  (*float = 1.*)
 (*output real*)
  (*-: float = 1.*)

(*1.0 * 2;;*)
 (*output esperado::*)
  (*Error: this expression expected type int*)
  (*but has type float*)
 (*output real*)
  (*Error: this expression has type float*)
  (*but an expression was expected of type int*) 
  (*refiriendose al 1)*)
 (*errores:*)
  (*forma de expresar el error*)

(*2-2.0;;*)
 (*output esperado:*)
  (*Error: this expression has type float*)
  (*but an expression was expected of type int*)
  (*refiriendose al 2.0*) 
(*output real:*)
  (*Error: this expression has type float 
  (*but an expression was expected of type int*) 
Ã
(*3.0 + 2.0;;*)
 (*output esperado:*)
  (*error: this expression has type float,*)
  (*but an expression whas expected of type int*)
  (*(la suma es de ints, no floats)*)
(*output real:*)
  (*Error: this expression has type float,*)
  (*but an expression whas expected of type int*) 
  (*(la suma es de ints, no floats)*)

5 / 3;;
 (*output esperado:*)
  (*float = 1.6666*)
 (*output real:*)
  (*-: int = 1*)
 (*error:*)
  (*/ es division de ints, ademas tanto 3 como 5*)
  (*son ints*)

5 mod 3;;
 (*output esperado:*)
  (*int = 2*)
 (*output real:*)
  (*-: int = 2*)

3.0*.2.0**3.0;;
 (*output esperado:*)
  (*int = 24*)
 (*output real:*)
  (*-: int = 24*)

3.0 = float_of_int 3;;
 (*output esperado:*)
  (*bool = true*)
 (*actual result:*)
  (*-: bool = true*)

(*sqrt 4;;*)
 (*output esperado:*)
  (*Error: this expression has type int,*)
  (*but an expression was expected of type float*)
  (*(refiriendose al 4)*)
 (*output real:*)
  (*Error: this expression has type int,*)
  (*but an expression was expected of type float*) 

int_of_float 2.1 + int_of_float(-2.9);;
 (*output esperado:*)
  (*int = 0*)
 (*output real:*)
  (*-: int = 0*)

truncate 2.1 + truncate (-2.9);;
 (*output esperado:*)
  (*int = 0*)
 (*output real:*)
  (*-: int = 0*)

floor 2.1 +. floor (-2.9);;
 (*output esperado:*)
  (*float = -1.*)
 (*output real:*)
  (*-: float = -1.*)

ceil 2.1 +. ceil -2.9;;
 (*output esperado:*)
  (*Error: this expression has type float -> float*)
  (*but an expression was expected of type float*)
  (*refiriendose a la funcion ceil*)
 (*output real:*)
  (*error: this expression has type float -> float*) 
  (*but an expression was expected of type float*)
  (*(refiriendose a ceil)*)

2.0 ** 3.0 ** 2.0;;
 (*output esperado:*)
  (*float = 512*)
 (*output real:*)
  (*-: float = 512*)

'B';;
 (*output esperado:*)
  (*char = B*)
 (*output real::*)
  (*-: char = 'B'*)
 (*error:*)
  (*chars are represented inside ''*)

int_of_char 'A';;
 (*output esperado:*)
  (*int = 65*)
 (*output real:*)
  (*-: int = 65*)

Char.code 'B';;
 (*output esperado:*)
  (*int = 66*)
 (*output real:*)
  (*-:int = 66*)

Char.chr 67;;
 (*output esperado:*)
  (*char = C*)
 (*output real:*)
  (*-: char = 'C')*

'\067';;
 (*output esperado:*)
  (*char = 'C'*)
 (*output real:*)
  (*-: char = 'C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
 (*output esperado:*)
  (*char =' m'*)
 (*output real:*)
  (*-: char = 'm'*)

Char.uppercase 'm';;
 (*output esperado:*)
  (*char = 'M'*)
 (*output real:*)
  (*Alert deprecated: Stdlib.Char.uppercase*)
  (*Use Char.uppercase_ascii instead.*)
  (* i am using version 4.12.0*)
  (*-: char = 'M'*)
 (*error:*)
  (*esta funcion no esta recomendada en la ultima version*)

Char.lowercase 'O';; 
 (*output esperado:*)
  (*aviso funcion no recomendada*)
  (*char = 'o'*)
 (*output real:*)
  (*Alert deprecated: Stdlib.Char.lowercase*)
  (*Use Char.lowercase_ascii instead*)
  (*i am using version 4.12.0*)Ã
  (*-: char = 'o'*)
 (*error:*)
  (*aviso funcion no recomendada mal redactado*)

"this is a string";;
 (*output esperado:*)
  (*string = "this is a string"*)
 (*output real:*)
  (*-: string = "this is a string"*)

String.length "longitud";;
 (*output esperado:*)
  (*int = 8*)
 (*output real:*)
  (*-: int = 8*)

"1999"+"1";;
 (*output esperado:*)
  (*error: this expression has type string*)
  (*but an expression was expected of type int*)
  (*(refiriendose al 1999)*)

 (*output real:*)
  (*error: this expression has type string*) 
  (*but an expression was expected of type int*)

"1999" ^ "1";; 
 (*output esperado:*)
  (*string = "19991"*)
 (*output real:*)
  (*-: string = "19991"*)

int_of_string "1999"+1;;
 (*output esperado:*)
  (*int  = 2000*)
 (*output real:*)
  (*-: int = 2000*)

"\064\065";;
 (*output esperado:*)
  (*string =  "@A"*)
 (*output real:*)
  (*-: string = "@A"*)

string_of_int 010;;
 (*output esperado:*)
  (*string = "10"*)
 (*output real:*)
  (*-: string = "10"*)

not true;;
 (*output esperado:*)
  (*bool = false*)
 (*output real:*)
  (*-: bool = false*)

true && false;;
 (*output esperado:*)
  (*bool = false*)
 (*output real:*)
  (*-: bool = false*)

true || false;;
 (*output esperado:*)
  (*bool = true*)
 (*output real:*)
  (*-: bool = true*)

(1<2)=false;;
 (*output esperado:*)
  (*bool = false*)
 (*output real:*)
  (*-: bool = false*)

"1"<"2";;
 (*output esperado:*)
  (*bool = true*)
 (*output real:*)
  (*-: bool = true*)

2<12;;
 (*output esperado:*)
  (*bool = true*)
 (*output real:*)
  (*-: bool = true*)

"2" < "12";;
 (*output esperado:*)
  (*bool = true*)
 (*actual result:*)
  (*-: bool = false*)
 (*error:*)
  (*la comparacion de strings se hace 1-1*)
  (*2 es mayor a 1, entonces el resultado es falso*)

"uno" < "dos";;
 (*output esperado:*)
  (*bool = false*)
 (*output real:*)
  (*-: bool = false*)

if 3 = 4 then 0 else 4;;
 (*output esperado:*)
  (*int = 4*)
 (*output real:*)
  (*-: int = 4*)

if 3 = 4 then "0" else "4";;
 (*output esperado:*)
  (*string = "4"*)
 (*output real:*)
  (*-: string = "4"*)

(*if 3=4 then 0 else "4";;*)
 (*output esperado:*)
  (*error: this expression has type string*)
  (*but an expression was expected of type int*)
   (*(refiriendose al "4"*)
 (*output real:*)
  (*Error: this expression has type string,*) 
  (*but an expression was expected of type int*)

(if 3 < 5 then 8 else 10) + 4;;
 (*output esperado:*)
  (*int = 12*)
 (*output real:*)
  (*-: int = 12*)

2.0 *. asin 1.0;;
 (*output esperado:*)
  (float 3.14159**)
 (*output real:*)
  (*-: float = 3.14159265358979312*)
 (*error:*)
  (*el float tiene 17 posiciones detras de la coma*)

sin ( 2.0 *. asin 1.0 /. 2.);;   
 (*output esperado:*)
  (*float = 1.*)
 (*output real:*)
  (*-: float = 1.*)

function x -> 2 * x;;
 (*output esperado:*)
  (*int -> int = fun*)
 (*output real:*)
  (*- : int -> int = <fun>*)
 (*error:*)
  (*funciones escritas como <fun>*)

(function x -> 2 * x) ( 2 + 1 );;
 (*output esperado:*)
  (*int = 6*)
 (*output real:*)
  (*-: int = 6*)

let x = 1;;
 (*output esperado:*)
  (*x : int = 1*)
 (*output real:*)
  (*-:val x : int = 1*)
 (*error:*)
  (*hay que indicar val*)

let y = 2;;
 (*output esperado:*)
  (*val y : int = 2*)
 (*output real:*)
  (*-: val y : int = 2*)

x-y;;
 (*output esperado:*)
  (*int = -1*)
 (*output real:*)
  (*- : int = -1*)

z;;
 (*output esperado:*)
  (*error: undefined val z*)
 (*output real:*)
  (*-:error: unbound value z*)
 (*error:*)
  (*se expresa como que z tiene un valor no bounded*)

let z = x+y;;    
 (*output esperado:*)
  (*val z : int = 3*)
 (*output real:*)
  (*-:val z : int = 3*)

z;;
 (*output esperado:*)
  (*int = 3*)
 (*output real:*)
  (*-:int = 3*)

let x = 5;;
 (*output esperado:*)
  (*val x : int = 5*)
 (*output real:*)
  (*val x : int = 5*)

z;;
 (*output esperado:*)
  (*int = 3*)
 (*output real:*)
  (*-: int = 3*)

let y = 5 in x + y;; 
 (*output esperado:*)
  (*int = 10*)
 (*output real:*)
  (*-: int = 10*)

x+y;;
 (*output esperado:*)
  (*int = 7*)
 (*output real:*)
  (*-: int = 7*)

let x = x + y in let y = x * y in x + y + z;;
 (*output esperado:*)
  (*int = 24*)
 (*output real:*)
  (*-: int = 24*)

x + y + z;;
 (*output esperado:*)
  (*int = 10*)
 (*output real:*)
  (*-: int = 10*)

int_of_float;;
 (*output esperado:*)
  (*float -> intt = <fun>*)
 (*output real:*)
  (*-: float -> int = <fun>*)

float_of_int;;
 (*output esperado:*)
  (*int -> float = <fun>*)
 (*output real::*)
  (*-: int -> float = <fun>*)

int_of_char;;
 (*output esperado:*)
  (*char -> int = <fun>*)
 (*actual result:*)
  (*-: char -> int = <fun>*)

char_of_int;;
 (*output esperado:*)
  (*int -> char = <fun>*)
 (*output real:*)
  (*-: int -> char = <fun>*)

abs;;
 (*output esperado:*)
  (*int -> int = <fun>*)
 (*output real:*)
  (*-: int -> int = <fun>*)

sqrt;;
 (*output esperado:*)
  (*float -> float = <fun>*)
 (*output real:*)
  (*-: float -> float = <fun>*)

truncate;;
 (*output esperado:*)
  (*float -> int = <fun>*)
 (*output real:*)
  (*-: float -> int = <fun>*)

ceil;;
 (*output esperado:*)
  (*float -> float = <fun>*)
 (*output real:*)
  (*-: float -> float = <fun>*)

floor;;
 (*output esperado:*)
  (*float -> float = <fun>*)
 (*output real:*)
  (*-: float -> float = <fun>*)

Char.code;;
 (*output esperado:*)
  (*char -> int = <fun>*)
 (*output real:*)
  (*-: char -> int = <fun>*)

Char.chr;;
 (*output esperado:*)
  (*int -> char = <fun>*)
 (*output real:*)
  (*-: int -> char = <fun>*)

Char.uppercase;;
(*output esperado:*)
  (*Alert deprecated: Stdlib.Char.uppercase*)
  (*Use Char.uppercase_ascii instead*)
  (*chat -> char = <fun>*)
*)
(*output real:*)
  (*Alert deprecated: Stdlib.Char.uppercase*)
  (*Use Char.uppercase_ascii instead*)
  (*-: char -> char = <fun>*)

Char.lowercase;;
 (*output esperado:*)
  (*Alert deprecated: Stdlib.Char.lowercase*)
  (*Use Char.lowercase_ascii instead*)
  (*chat -> char = <fun>*)
 (*output real:*)
  (*Alert deprecated: Stdlib.Char.lowercase*)
  (*Use Char.lowercase_ascii instead.*)
  (*-: char -> char = <fun>*)

int_of_string;;
 (*output esperado:*)
  (*string -> int = <fun>*)
 (*output real:*)
  (*-: string -> int = <fun>*)

string_of_int;;
 (*output esperado:*)
  (*int -> strinf = <fun>*)
 (*output real:*)
  (*-: int -> string = <fun>*)

String.length;;
 (*output esperado:*)
  (*string -> int = <fun>*)
 (*output real:*)
  (*-: string -> int = <fun>*)

let f = function x -> 2 * x ;;
 (*output esperado:*)
  (*val f : int -> int = <fun>*)
 (*output real:*)
  (*-: val f : int -> int = <fun>*)

f (2+1);;
 (*output esperado:*)
  (*int = 6*)
 (*ouput real:*)
  (*-: int = 6*)

f 2 + 1 ;;
 (*output esperado:*)
  (*int = 5*)
 (*output real:*)
  (*-: int = 5*)

let n = 1 ;;
 (*output esperado:*)
  (*val n : int = 1*)
 (*actual result:*)
  (*val n : int = 1*)

let g x = x + n ;;
 (*output esperado:*)
  (*val g : int -> int = <fun>*)
 (*output real:*)
  (*-:val g : int -> int = <fun>*)

g 3 ;;
 (*output esperado:*)
  (*int = 4*)
  (*output real:*)
  (*-: int = 4*)

let n = 5 ;;
 (*output esperado:*)
  (*val n  :int = 5*)
 (*output real:*)
  (*-: val n : int = 5*)

g 3 ;;
 (*output esperado:*)
  (*int = 4*)
 (*output real:*)
  (*-: int = 4*)


