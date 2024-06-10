let base_msg = "readu [command]"
(* let add_msg = "readu add <title> [-c] [-p] [-v] [-vc]" *)

(* Args *)
let anon_args = ref []
let pages : int option ref = ref None

(* let chapters : int option ref = ref None *)
(* let volumes : int option ref = ref None *)
(* let volume_chapters : int option ref = ref None *)

(* Setters *)
let set_optional_pages opt_pages = pages := Some opt_pages
let append_anonymous_arg arg = anon_args := arg :: !anon_args

let execute anon_args =
  match anon_args with
  | [] -> Printf.printf "Readu - A Reading list CLI tool"
  | subcmd :: args -> (
      let subcommand = Subcommand.parse_subcommand subcmd in
      match subcommand with
      | None ->
          Printf.printf "Error something went wrong here...";
          ()
      | Some v -> Subcommand.execute_subcommand v args)

(* Spec *)
let speclist = [ ("-p", Arg.Int set_optional_pages, "Set the number of pages") ]

let () =
  Arg.parse speclist append_anonymous_arg base_msg;
  (* print_args !anon_args; *)
  execute (List.rev !anon_args)
