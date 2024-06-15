type subcommand = Add | Remove

let parse_subcommand cmd =
  let trimmed_cmd = String.trim cmd in
  match String.lowercase_ascii trimmed_cmd with
  | "add" -> Some Add
  | "remove" -> Some Remove
  (* | "view" -> Some Remove *)
  | _ -> None

let execute_subcommand args options = function
  | Add -> Handlers.handle_add args options
  | Remove -> Handlers.handle_remove args options
(* | View -> Handlers.handle_view args options *)
