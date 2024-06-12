type book

val book_of_json_string : string -> book
val new_book : string -> int option -> book
val book_to_json_string : book -> string
