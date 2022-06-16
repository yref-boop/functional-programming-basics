let rec fact = function
	0->1
	| n-> n* fact (n-1)
let size = Array.lenght Sys.argv
let _ = 
	if size <> 2 then print_endline "error"
	else print_endline(strinf_of_int(fact(int_of_string(Array.get Sys.argv(1)))))
