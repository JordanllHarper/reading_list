open Readu_lib.Book

let error_message_no_title = "Error, no title given. Please give a title"

let parse_options title options =
  let pages = match options with [] -> None | head :: _ -> head in
  let _remaining = match options with [] -> [] | _ :: tail -> tail in
  new_book title pages

let write_book_to_json book =
  let file_path = Util.book_path book.title in
  let oc = open_out file_path in
  let book_json = book_to_json_string book in
  Printf.fprintf oc "%s" book_json;
  close_out oc

let handle_add anon_args options =
  match anon_args with
  | [] -> prerr_endline error_message_no_title
  | head :: _ ->
      print_endline ("Adding new book: " ^ head);
      parse_options head options |> write_book_to_json;
      print_endline ("Book added: " ^ head)

let handle_remove = function
  | [] -> prerr_endline error_message_no_title
  | head :: _ ->
      Util.book_path head |> Sys.remove;
      print_endline ("Book " ^ head ^ " deleted!")
