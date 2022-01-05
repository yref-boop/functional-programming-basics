let rec fact = function
	0 -> 1
	| n -> n * fact (n-1)

let size = Array.length Sys.argv

let _ =
	if size <> 2 then print_endline "error"
	else 
        try
        print_endline(string_of_int(fact(int_of_string(Sys.argv(1)))))
        with
            Failure "int_of_string" -> print_endline "Please, use a number as input"
    | Stack_overflow -> print_endline "Please, use only positive integers"
    | Invalid_argument "index out of bounds" -> print_endline "Invalid argument"

;;

