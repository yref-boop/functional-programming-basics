(*definir valor u de tipo int a partir de una expresion que contenga, al menos 4 operadores infijos:*)
let n = (1 + 2 * 3 - 4 / 5);;

(*definir un valor v de tipo float a partir de una expresion que incluya una funcion predefinida:*)
let v = asin 5.;;

(*definir un valor w de tipo char a partir de una expresion que incluya una sub-expresion de tipo int:*)
let w = char_of_int(1+17);;

(*definir un valor x de tipo bool a partir de una expresion que incluya una o mas funciones u operadores:*)
let x = float_of_int(int_of_char('a')) < sin 5.;;

(*definir un valor y de tipo string a partir de una expresion que contenga una frase if-then-else:*)
let y = if 3 = 4 then "impossible" else "math is math";;


