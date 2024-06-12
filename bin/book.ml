type book = {
  title : string;
  pages : int option;
      (* chapters : int option; *)
      (* volumes : int option; *)
      (* volume_chapters : int option; (* How many chapters per volume *) *)
}

let new_book title pages = { title; pages }

let to_json (book : book) =
  match book.pages with
  | Some page -> `Assoc [ ("title", `String book.title); ("pages", `Int page) ]
  | None -> `Assoc [ ("title", `String book.title) ]

let from_json (json : Yojson.Safe.t) =
  match json with
  | `Assoc fields ->
      let title =
        match List.assoc "title" fields with
        | `String s -> s
        | _ -> failwith "Invalid title"
      in
      let pages =
        match List.assoc "pages" fields with
        | `Int pages -> Some pages
        | _ -> None
      in
      { title; pages }
  | _ -> failwith "Invalid json"

let book_to_json_string book = to_json book |> Yojson.Safe.to_string
let book_of_json_string json = Yojson.Safe.from_string json |> from_json
let sum = if 5 > 7 then 7 else 67
