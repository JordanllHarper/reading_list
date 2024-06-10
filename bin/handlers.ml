let build_book title =
  let book : Book.book =
    {
      name = title;
      pages = None;
      chapters = None;
      volumes = None;
      volume_chapters = None;
    }
  in
  print_endline book.name

let handle_add args =
  print_endline "Adding new book";
  match args with
  | [] -> prerr_endline "Error, no title given. Please give a title"
  | head :: _ -> build_book head
