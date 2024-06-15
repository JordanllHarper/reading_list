let base_msg = "readu [command]"
let anon_args = ref []
let pages = ref (-1)

(* let chapters : int option ref = ref None *)
(* let volumes : int option ref = ref None *)
(* let volume_chapters : int option ref = ref None *)

let append_anonymous_arg arg = anon_args := arg :: !anon_args

let create_optional_args_list pages =
  let options = [] in
  pages :: options

let handle_subcommands subcmd args options =
  let subcommand = Subcommand.parse_subcommand subcmd in
  match subcommand with
  | None ->
      Printf.printf "Invalid subcommand, please try typing readu --help";
      ()
  | Some v -> Subcommand.execute_subcommand args options v

let execute anon_args options =
  match anon_args with
  | [] ->
      Printf.printf "Readu - A Reading list CLI tool. Type --help for options"
  | subcmd :: args -> handle_subcommands subcmd args options

(* Spec *)
let speclist =
  [
    ( "-pages",
      Arg.Int (fun set_pages -> pages := set_pages),
      "Set the number of pages" );
  ]

let create_readu_if_not_exists =
  if not (Sys.file_exists Util.readu_path) then
    try Sys.mkdir Util.readu_path 0o777 with
    | Not_found ->
        prerr_endline
          "HOME environment variable not found. Please set your home \
           environment variable before running readu again."
    | _ -> prerr_endline "Something else went wrong :("

let () =
  create_readu_if_not_exists;
  Arg.parse speclist append_anonymous_arg base_msg;
  let deref_pages = !pages in
  let maybe_pages = if deref_pages < 1 then None else Some deref_pages in
  let options = create_optional_args_list maybe_pages in

  execute (List.rev !anon_args) options
