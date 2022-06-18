# ocaml notes

## basics
ocaml is a general purpose, multiparadigm programming language, including in its toolchain an interactive top-level interpeter, a bytecode compiler a native code compiler, a debugger and a package manager

files with ocaml code tend to use .ml extension

ocaml executables can be executed in a virtual machine or on the bare metal

compilation errors (typing errors, unbound values, syntax errors...)
execution error -> exceptions

### modules
prdefined functions and values in ocaml are organized in modules
they can be called by writting the name of the module just before the specific value, separated by a dot .
```
 # Char.code 'A';;
 - : int = 65
```

the base module is called Stdlib and there is no need for it to be explicitely called before calling its functions

## primitive types
ocaml has the basic types present in most languages, integer, float, boolean...

```
 # 3;;
 - : int = 3
 # 3.;;
 - : float = 3.
 # true
 - : bool = true
 # 'a';;
 - : char = 'a'
 # "function";;
 - : string = "function"
```

as well as a type representing nothing / emptiness generally used for I/O code

```
 # ();;
 - : unit () 
 # print_endline "";;

 - : unit()
```

ocaml is a strongly typed programming language, that is, types restrictions are defined such that types are not intermixed , leading to a less flexible but less error-prone code

all type checking is done at compilation time, leading to no possible type error during execution, with no checking for those errors, execution is faster

it also implements type infering, so that the language understands the type of each value without the need for it to be explicitely stated

an effect of this is the existence of different infix operators (+), (+.), (/), (/.)... for each datatype

fun fact: integers in ocaml are defined as $\mathbb{Z}_{2^63}$

### tuples
moreover, ocaml allows tuples composed of any datatype, whose type would be the cardinal product of the types used:
```
 # (1,7);;
 - : int * int = (1,7)
 # (0, false)
 - : int * bool = (0, false)
```
it also allows for other tuples to be part of tuples:
```
 # ((3.14 , 'p'), "math");;
 - : (float * char) * string = (3.14 , 'p'), "math");;
```
the individual elements can be obtained by using the functions `fst` and `scd`

### lists
in ocaml finite sequences can be represented as list
lists can have any number of elements but must be composed of the same datatype and any datatype is valid
they are represented by [], separating elements by ;
```
 # ['a';'e';'i';'o';'u'];;
 - : char list = ['a';'e';'i';'o';'u'];
 # [();()];;
 - : unit list = [();()]
```
the empty list is the same for all datatypes, using the polymorfic datatype 'a
```
 # [];;
 - : 'a list = []
```
there is a whole module defined for lists, the List
most notable functions are
```
 # List.hd;;
 - : 'a list -> 'a = <fun>
```
```
 # List.tl;;
 - : 'a list -> 'a list = <fun>
```
```
 # List.length;;
 - : 'a list -> int  = <fun>
```
```
 # List.nth;;
 - : 'a list -> int -> 'a = <fun>
```
```
 # (@);;
 - : 'a list -> 'a list -> 'a list = <fun>
```
```
 # List.append;;
 - : 'a list -> 'a list -> 'a list = <fun>
```
```
 # List.concat;;
 - : 'a list list -> 'a list = <fun>
```
```
 # List.rev;;
 - : 'a list -> 'a list = <fun>
```
```
 # List.map;;
 - : ('a -> 'b) -> 'a list -> 'b list = <fun>
```
```
 # List.filter;;
 - : ('a -> bool) -> 'a list -> 'a list = <fun>
```
```
 # List.mem;;
 - : 'a -> 'a list -> bool = <fun>
```
```
 # List.exists;;
 - : ('a -> bool) -> 'a list -> bool = <fun>
```
```
 # List.for_all;;
 - : ('a -> bool) -> 'a list -> bool = <fun>
```
```
 # List.find;;
 - : ('a -> bool) -> 'a list -> 'a = <fun>
```
```
 # List.init;;
 - : int -> (int -> 'a) -> 'a list = <fun>
```
lists can be also constructed 

### definitions
different data can be stored for later use so that repeated code needen't be executed several times
this is possible by the use of the reserved word `let` 
```
 # let pi = 2. *. asin 1.;;
 - : val pi : float = 3.14159265358979312
```
definitions are kept for the module / session

in the case of wanting to use the same name for a new definition, the ambiguity is solved by using only the last definition, the previous definition is not eliminated, since there is no variable to erase
unlike imperative programming, here definitions are just names assigned to certain values, there is no concept of "box" or "imperative variable"

#### local definitions
definitions can be used locally, to restrict its scope
to use it, a definition such as `let <definition>` is made, followed by an expression preceded by an in: `in <expression>`
such that:

```
 # let pi = 2. *. asin 1.;;
 - : val pi : float = 3.14159265358979312
 # let pi = 3.14 in 3. *. pi +. 2. *. pi ** 2.;;
 -: float = 29.1392000000000024
 # pi;;
 - : val pi : float = 3.14159265358979312
```
as it can be seen here, the scope of the local definition is just the expression after the if, thus, if a variable pi is called again, the only definition on scope is the previous one, and that's the one used


as expected, the definition can be used not only for basic types, but also for functions and other types
```
 # let no = not;;
 val no : bool -> bool <fun>
```

definitions can be nested:
```
 # let x = 10;;
 val x : int = 10
 # let x = 1024 in x * x * x;;
 - : int = 1073741824
 # let x = 2 * x in let x = x + 1 in x * x * x;;
 - : int = 9261
 # let y = let x = 1024 in x * x * x;;
 - : int = 1073741824
```

#### datatype definition
```
type maybe_an_int = 
    Some of int
    | None
;;
```
`type boolean = T | F;;`

#### binary tree datatype I
definition of the type:
```
type 'a tree = 
    V
    | N of 'a tree 'a tree * 'a tree
;;
```

functions:
```
let rec nnodes = function
    V -> 0
    | N (_,i,d) -> 1+ nnodes i + nnodes d;;
;;
```
```
let rec height = function 
    V -> 0
    | N (_i,d) -> 1 + max (nnodes i + nnodes d)
;;
```
```
let rec preorder = function
    V -> []
    | N (root, left, right) -> right :: preorder left @ preorder right
;;
```
```
let rec leaves = function
    V -> []
    | N (root, V, V) -> [r]
    | N (root, left, right) -> leaves left @ leaves right
;;
```

#### full binary tree datatype
definition of the type:
```
type 'a btree = 
    Leaf of 'a
    | Node of 'a * 'a btree * 'a btree
;;
```

#### general tree datatype
datatype definition:
```
type 'a gtree =
    GT of 'a * 'a gtree list
;;
```

```
let rec nngtree = function
    GT (_, l) -> List.fold_left (+) 1 (List.map nngtree l)
;;

let rec nngtree (GT (_, l)) = List.fold_left (+) 1 (List.map nngtree l);;
```


### inflix operators
in ocaml there exists different infix operators (+), (+.), (/), (/.)... for each datatype

some remakable operators:
`=` structural equality
`==` physical equality
`<>` structural inequality
`!=` physical unequality
`**` exponentiation
`sqrt`, `exp`, `log`

also, new infix operators can be defined by using () in its definition:
```
# let (+++) x y = x + 2 * y;;
# 3 +++ 4;;
```

## functions
in ocaml functions are also types, which state the types that are used as input and returned as output
```
 # asin;;
 - : float -> float = <fun>
 # abs;;
 - : int -> int = <fun>
 # print_endline;;
 - : string -> unit = <fun>
```
they are applied by calling it with its arguments
```
 # sqrt 10.;;
 - : float 3.16227766016837952
```
new personal functions can be implemented by several ways
all possible cases can be explicitely written:
```
function true -> false | false -> true;;
```
this one with the type `bool -> bool = <fun>`

or it can be infered from a general case:
```
function double x -> 2 * x;;
```
with the type `int -> int = <fun>`
(note that the x written is a variable in the mathematical sense, it has no specific value as in a definition or imperative variable)

this self made functions can also be applied as the predefined ones, by just adding the input after it:
```
 # (function double x -> x * x) 3;;
 - : int 6
```

on execution, the application of a function will always be prioritized over infix operator

### function definition
new functions can be defined for future use as stated previously using let
in this case, the only thing needed is to write the `let` before the expression of the function

also, they can be defined as follows:
```
 # let double = function x -> x * x;;
 val double : int -> int = <fun>
```
by doing this, the function can be applied just by writting the inputs right after the name given to the function such that:
```
 # double 17;;
 : - int = 54;
```

moreover, this application can be defined with another definition such that
```
 # let x = 17 in x * x;;
```

#### scope of local definitions in functions:
the exact placement of definitions inside functions plays a major role on the efficiency of a program
for example, a value used on several functions can be defined before the definition of the function

```
let pi = 2. *. asin 1.;;

let per_area r =
    2. *. pi *. r, pi *. r *. r. ;;
```
in other cases, we would want the value to only be accessible but our function, this can be archieved by defining pi inside the function itself:
```
let per_area r =
    let pi = 2. *. asin 1. in
    2. *. pi *. r , pi *. r *. r
;;
```
yet this implies the calcuclation of pi each time the function is called
for the value of pi to only be calculated once, but still only being accessible by the function, it can be implemented as follows:
```
let per_area = 
    let pi = 2. *. asin 1 in
    function r -> 
        2. *. pi *. r , pi *. r *. r
;;
```
in this way, the value of pi is only calculated on the definition of per_area, and each time the function is called only the function will be calculated

### pattern matching
the evaluation of functions following predefined patterns depending on the input is called pattern matching
pattern matching should cover all possible patterns for the defined dominion, what is called exhaustive pattern matching to avoid execution problems where the input does not meet any of the defined patterns and aborts with an exception to avoid undefined behaviour

it must be noted that the order in which the patterns are checked is always the same, and once one is evaluated to be true, the function executes its code, without checking for more, thus the order of the patterns is very important

#### wildcards (polymorphism)
in case that any possible input should match with a pattern, a wildcard, `_` can be used
```
 # let alltrue = function _ -> true;;
 val alltrue : 'a -> bool = <fun>
```
note that the type of `_` is not any specific type, since it could potentially match with any value of any type, this is represented with an alpha (`'a`)
this is an expression of polymorfism
it must be noted that since in ocaml there must always be a defined type, in this case 'a is an specific type, a polymorfic type that could be represented as any of the others

in order to specify a type,  if the compiler cannot derive it from other patterns, it must be done as follows:
```
 # let identity = function x -> x;;
 val identity : 'a -> 'a = <fun>
 # let identity_int : int -> int = function x -> x;;
 val identity_int : int -> int = <fun>
```
or without having to redefine it:
```
 # let identity = function x -> x;;
 val identity : 'a -> 'a = <fun>
 # let identity_int : int -> int = identity;;
 val identity_int : int -> int = <fun>
```

### higher order functions
in ocaml, it is possible to have functions that take several attributes as inputs
since functions can only have one origin and one destiny, in ocaml, for each attribute there exists a function that is applied to the next, until the last provides the result
for example
```
 # let f = function x -> function y -> x + y ;;
 - : int -> int -> int = <fun>
```
it efectively sums two different numbers
the application of consecutive functions is left associative

sppecifically in this case, f will return a function from integers to integers when applied to an integer, which can be applied to integers and will return a single integer:
```
# f 5;;
- : int -> int = <fun>
```
the function that is returned is a function that sums 5 to any number that is given as input:
```
# (f 5) 2;;
- : int = 7
```
* note that if the attributes are inside of a tuple, it technically is just an attribute, thus there should be no need for higher order functions

### simplified notation (η reduction)
when defining functions that only present one rule
it is similar to mathematical notation:

```
# let alltrue = function _ -> true;;
val alltrue : 'a -> bool = <fun>
# let alltrue _ = true;;
val alltrue : 'a -> bool = <fun>
```
```
# let double = function x -> 2 * x;;
val double : int -> int = <fun>
# let double x = 2 * x;;
val double : int -> int = <fun>
```
for functions which return functions it can also be used as long as thereis only one rule, for example:
```
# let f = function x -> function y -> x + y;;
val f : int -> int -> int = <fun>
```
would become
```
# let f x = function y -> x + y;;
val f : int -> int -> int = <fun>
```
and applying it again it would be
```
# let f x y = x + y;;
val f : int -> int -> int = <fun>
```

### logic control
in order to control the flow of the progoram in a logic manner (check logic properties) there exists the expression `if ... then ... else`
it must be noted that all "branches" of the logical evaluation must return values of the same type for the whole expression to make sense

moreover, the infix operators related to logic would be `not`, `&&`, `||`

for example, a function that returns the maximum: 
```
# let max x y = if x < y then y else x;;
val max : 'a -> 'a -> 'a = <fun>
```

### eager evaluation
ocaml is a programming language with eager evaluation, thus, all expressions are evaluated as soon as they are encountered
for local definitions, for example, it means that the first let will be evaluated as soon as it is encountered

for example the following code: 
```
(function true -> false | false -> true) (2 < 3);;
```
should invert a boolean value
in this case, the execution will be as follows
- first the boolean condition on the input
- then its value will be compared with the origin of the first pattern, since it matches it will execute it (return false)
- if it didn't match it will try with the next, and so on until a pattern is satisfied or it fails

this example on the logical infix operators would be executed as:
```
<e1> && <e2>;;
if <e1> then <e2> else false;;
```
```
<e1> || <e2>;;
if <e1> then true else <e2>;;
```

### recursivity
recursion allows a function to call itself from within its own code
some functional programming languages such as ocaml do not define any looping constructs, but rely solely on recursion to repeatedly call code

it is proved in computability theory that these recursive-only languages are turing complete

in ocaml recursion is implemented by adding the reserved word `rec` on the definition of the function:

```
let rec fact n =
    if n <= 0 then 1
    else n * fact (n-1)
;;
```

in order to avoid infinite recursive calls a base case is always needed

#### tail call and stack overflow
repeatedly calling a function from within itself may cause the call stack to have a size equal to the sum of the input sized of all involved calls
hence, the importance of using optimisation techniques such as tail call on large problems

specially problematic are the operations "left behind" on recursive calls:
with the previous example, each recursive call will store on memor a `n * ...` operation to be made in backwards order once the last case has been reached

when the definition of a function does not have this kind of leftovers, it is said to have a tail call, that is, the execution will be finished as soon as the last recursive call is finished and does not need to store leftovers on memory

ocaml provides space on the stack to aproximately store 300000 basic operations

an example of tail call recursive function:
```
let fact n =
    let rec aux f = function
        0 -> f
        | i -> aux (f * i) (i-1)
    in function n -> aux 1 n
;;
```
note that here the method to archive the tail-end recursion is to create an auxiliar function that keeps the value of the operations as an attribute

##### auxiliar definitions on recursive functions with tuples as result

when a recursive function returns a simple element, leftover operations can be easily implemented if needed to calculate the answer:
```
let rec quo x y =
    if x < y then 0
    else 1 + div (x-y) y
;;
```
```
let rec rem x y =
    if x < y then x
    else div (x-y) y
;;
```
however, if the structure to be returned is more complex, one cannot just simply operate between tuples:
the following code would be incorrect since tuples cannot be summed, only its elements can
```
let rec div x y =
    if x < y then (0, x)
    else (1,0) + div (x-y) y
;;
```
in order for one to modify and store the values of thee tuple on each iteration, they can be stored in an auxiliar value:
```
let rec div x y =
    if x < y then (0, x)
    else let quo rem = div (x-1) y
        in  1 + quo, rem
;;
```
this way we can indicate that for each recursive call, the value for the next call will be (x-1, y) and there is a leftover operation that adds +1 on the first element of the tuple

let rec fib = function
    1 -> 1,0
    | let x, y = fib (x - 1)
        in x + y, x
;;

### match... with patterns
on ocaml we can also perform pattern mathcing following the model of `match ... with`

```
let rec append = function
    [] -> (function l -> l)
    | h::t -> (function l -> h :: append t l)
```
```
let rec append l1 l2 = 
    match l1 with 
        [] -> l2
        | h::t -> h :: append t l2
;;
```

### execution errors
while doing pattern matching we can forcibly stop the execution of the function by an exception, this can be done by calling `raise`
```
let hd function
    [] -> raise (Failure "hd")
    | h::_ -> h;;
```

#### try... with
```
let tl' l =
    try List..tl with
        Failure _ -> []
;;
```

```
let come (i1, j1) (i2, j2) =
    j1 = j2 || abs (i2-i1) = abs (j2 - j1)
;;

let rec compatible p = function 
    [] -> true
    | [h::t] -> not (come p h) && compatible p t
;;

let queens n =
  let rec complete path (i,j) =
        if i > n then path
        else if j < n then raise Not_found
            else if compatible (i,j) path then
                try completa ((i,j):: path) (i,j+1)
            else completa path (i, j+1)
        in completa [] (1,1)
;;
```
