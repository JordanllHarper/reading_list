let readu_path = Sys.getenv "HOME" ^ "/.readu"
let book_path title = readu_path ^ "/" ^ title ^ ".json"
let apply_if_some (f : 'a -> unit) = function Some x -> f x | None -> ()

let print_items_in_list mapping items =
  let mapped = List.map mapping items in
  List.iter print_endline mapped
