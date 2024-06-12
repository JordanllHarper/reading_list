open Book

let parse_pages title remaining =
  match remaining with
  | [] -> new_book title None
  | pages :: _ ->
      let integer_pages = int_of_string_opt pages in
      new_book title integer_pages

let handle_add args =
  print_endline "Adding new book";
  match args with
  | [] -> prerr_endline "Error, no title given. Please give a title"
  | head :: tail -> parse_pages head tail |> book_to_json_string |> print_string
