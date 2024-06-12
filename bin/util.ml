let readu_path = Sys.getenv "HOME" ^ "/.readu"

let rec print_items_in_list = function
  | [] -> ()
  | head :: tail ->
      print_string head;
      print_items_in_list tail
