let readu_path = Sys.getenv "HOME" ^ "/.readu"
let book_path title = readu_path ^ "/" ^ title ^ ".json"

let rec print_items_in_list = function
  | [] -> ()
  | head :: tail ->
      print_string head;
      print_items_in_list tail
