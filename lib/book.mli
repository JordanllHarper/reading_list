type t = {
  title : string;
  pages : int option;
      (* chapters : int option; *)
      (* volumes : int option; *)
      (* volume_chapters : int option; (* How many chapters per volume *) *)
}

val book_of_json_string : string -> t
val new_book : string -> int option -> t
val book_to_json_string : t -> string
val pretty_string_of_book : t -> string
