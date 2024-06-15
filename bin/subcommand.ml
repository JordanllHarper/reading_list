type subcommand = Add | Remove

let parse_subcommand cmd =
  let trimmed_cmd = String.trim cmd in
  match String.lowercase_ascii trimmed_cmd with
  | "add" -> Some Add
  | "remove" -> Some Remove
  | _ -> None

let execute_subcommand args = function
  | Add -> Handlers.handle_add args
  | Remove -> Handlers.handle_delete args
