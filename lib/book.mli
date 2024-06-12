type book = {
  title : string;
  pages : int option;
      (* chapters : int option; *)
      (* volumes : int option; *)
      (* volume_chapters : int option; (* How many chapters per volume *) *)
}

val book_of_json_string : string -> book
val new_book : string -> int option -> book
val book_to_json_string : book -> string
