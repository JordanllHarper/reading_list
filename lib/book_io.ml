open Book

let remove_entire_book title =
  print_endline ("Removing " ^ title);
  Util.get_book_path title |> Sys.remove;
  print_endline ("Book " ^ title ^ " deleted!")

let read_book_of_json title =
  let file_path = Util.get_book_path title in
  Util.read_book_of_json_file file_path

let read_book_of_json_file_name file_name =
  let path = Util.readu_path ^ "/" ^ file_name in
  Util.read_book_of_json_file path

let get_all_books () =
  let read_files = Sys.readdir Util.readu_path in
  Array.map read_book_of_json_file_name read_files |> Array.to_list

let write_book_to_json (book : Book.t) =
  let file_path = Util.get_book_path book.title in
  let oc = open_out file_path in
  let book_json = Book.book_to_json_string book in
  Printf.fprintf oc "%s" book_json;
  close_out oc;
  flush oc;
  ()
