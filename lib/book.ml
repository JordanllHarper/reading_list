type t = {
  title : string;
  pages : int option;
      (* chapters : int option; *)
      (* volumes : int option; *)
      (* volume_chapters : int option; (* How many chapters per volume *) *)
}

let new_book title pages = { title; pages }

let to_json (book : t) =
  match book.pages with
  | Some page -> `Assoc [ ("title", `String book.title); ("pages", `Int page) ]
  | None -> `Assoc [ ("title", `String book.title) ]

let from_json (json : Yojson.Safe.t) =
  let book =
    match json with
    | `Assoc fields ->
        let title =
          match List.assoc_opt "title" fields with
          | Some (`String s) -> s
          | _ -> failwith "Invalid title"
        in
        let pages =
          match List.assoc_opt "pages" fields with
          | Some (`Int pages) -> Some pages
          | _ -> None
        in
        { title; pages }
    | _ -> failwith "Invalid json"
  in
  book

let book_to_json_string book = to_json book |> Yojson.Safe.to_string
let book_of_json_string json = Yojson.Safe.from_string json |> from_json

(* Pretty printing *)
let separator = "-----------------------------"
let title_string title = Printf.sprintf "Title: %s" title
let pages_string pages = Printf.sprintf "Pages: %i" pages

let pretty_string_of_book book =
  match book.pages with
  | None ->
      Printf.sprintf "\n%s\n%s\n%s" separator (title_string book.title)
        separator
  | Some value ->
      Printf.sprintf "\n%s\n%s\n%s" (title_string book.title) separator
        (pages_string value)
