open Readu_lib.Book

let parse_pages title remaining =
  match remaining with
  | [] -> new_book title None
  | pages :: _ ->
      let integer_pages = int_of_string_opt pages in
      new_book title integer_pages

let write_book_to_json book =
  let file_path = Util.book_path book.title in
  let oc = open_out file_path in
  let book_json = book_to_json_string book in
  Printf.fprintf oc "%s" book_json;
  close_out oc

let handle_add args =
  print_endline "Adding new book";
  match args with
  | [] -> prerr_endline "Error, no title given. Please give a title"
  | head :: tail -> parse_pages head tail |> write_book_to_json

let handle_delete = function
  | [] -> prerr_endline "Error, no title given. Please give a title"
  | head :: _ ->
      Util.book_path head |> Sys.remove;
      print_endline "Book Deleted"
