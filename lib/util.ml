let readu_path = Sys.getenv "HOME" ^ "/.readu"
let get_book_path title = readu_path ^ "/" ^ title ^ ".json"
let apply_if_some (f : 'a -> unit) = function Some x -> f x | None -> ()

let read_contents_opt file_path =
  let ic = open_in file_path in
  try
    let contents = really_input_string ic (in_channel_length ic) in
    close_in ic;
    Some contents
  with _ -> None

let read_book_of_json_file file_path =
  let contents = read_contents_opt file_path in
  Option.map Book.book_of_json_string contents

let print_items_in_list mapping items =
  let mapped = List.map mapping items in
  List.iter print_endline mapped

let filter_none l =
  List.filter (fun x -> match x with None -> false | Some _ -> true) l
