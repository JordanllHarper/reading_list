let parse_options title options =
  let pages = match options with [] -> None | head :: _ -> head in
  let _remaining = match options with [] -> [] | _ :: tail -> tail in
  Book.new_book title pages

let error_message_no_title = "Error, no title given. Please give a title"

let error_book_invalid_book =
  "Invalid book, please type a book you have already added."
(* let handle_view_with_args args options =  *)
(* let apply_option_filters books options = *)

let handle_view args _options =
  print_endline "Viewing books...";
  let print_all_books = List.is_empty args in
  if print_all_books then
    let books = Book_io.get_all_books () in
    List.iter
      (fun (book : Book.t option) ->
        match book with
        | Some book -> print_endline @@ Book.pretty_string_of_book book
        | None -> ())
      books

let handle_remove_with_options title options =
  let book_from_json = Book_io.read_book_of_json title in
  match book_from_json with
  | None -> prerr_endline error_book_invalid_book
  | Some b ->
      let modified_book = parse_options b.title options in
      Book_io.write_book_to_json modified_book

let handle_remove args options =
  match args with
  | [] -> prerr_endline error_message_no_title
  | title :: _ ->
      if List.is_empty options then Book_io.remove_entire_book title
      else handle_remove_with_options title options

let handle_add anon_args options =
  match anon_args with
  | [] -> prerr_endline error_message_no_title
  | head :: _ ->
      print_endline ("Adding new book: " ^ head);
      parse_options head options |> Book_io.write_book_to_json;
      print_endline ("Book added: " ^ head)
