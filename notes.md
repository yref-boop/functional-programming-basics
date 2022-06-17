# ocaml notes

### basics
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

### primitive types
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

### expressions

### functions
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

on execution, the application of a function will always be prioritized over infix operators
moreover, the application of consecutive functions is left associative

for example:
```
# let f = function x -> function y -> x + y;;
val f : int -> int -> int = <fun>
```
in this case, f will return a function from integers to integers when applied to an integer, which can be applied to integers and will return a single integer:
```
# f 5;;
- : int -> int = <fun>
# (f 5) 2;;
- : int = 7
```

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


