open Util
open Readu_lib.Book

let remove_entire_book title =
  print_endline ("Removing " ^ title);
  get_book_path title |> Sys.remove;
  print_endline ("Book " ^ title ^ " deleted!")

let read_book_of_json title =
  let file_path = get_book_path title in
  print_endline file_path;
  let ic = open_in file_path in
  try
    let contents = really_input_string ic (in_channel_length ic) in
    close_in ic;
    Some (book_of_json_string contents)
  with _ -> None

let write_book_to_json book =
  print_endline book.title;
  let file_path = get_book_path book.title in
  let oc = open_out file_path in
  let book_json = book_to_json_string book in
  Printf.fprintf oc "%s" book_json;
  close_out oc;
  flush oc

let get_all_books =
  let read_files = Sys.readdir readu_path in
  Array.map read_book_of_json read_files |> Array.to_list
