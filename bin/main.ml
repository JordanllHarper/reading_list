open Subcommand
open Util

let _base_msg = "readu [command]"
let anon_args = ref []
let pages = ref (-1)

(* let chapters : int option ref = ref None *)
(* let volumes : int option ref = ref None *)
(* let volume_chapters : int option ref = ref None *)

let _append_anonymous_arg arg = anon_args := arg :: !anon_args

let _create_optional_args_list pages =
  let options = [] in
  pages :: options

let handle_subcommands subcmd args options =
  let subcommand = parse_subcommand subcmd in
  match subcommand with
  | None -> Printf.printf "Invalid subcommand, please try typing readu --help"
  | Some cmd -> execute_subcommand args options cmd

let _execute anon_args options =
  match anon_args with
  | [] ->
      print_endline "Readu - A Reading list CLI tool. Type --help for options"
  | subcmd :: args -> handle_subcommands subcmd args options

(* Spec *)
let _speclist =
  [ ("-pages", Arg.Int (fun p -> pages := p), "Set the number of pages") ]

let _create_readu_if_not_exists =
  if not (Sys.file_exists readu_path) then
    try Sys.mkdir readu_path 0o777 with
    | Not_found ->
        prerr_endline
          "HOME environment variable not found. Please set your home \
           environment variable before running readu again."
    | _ -> prerr_endline "Something else went wrong :("

let _parse_pages deref_pages =
  if deref_pages < 1 then None else Some deref_pages

let () = print_endline "Hello, worD!"
(* create_readu_if_not_exists; *)
(* Arg.parse speclist append_anonymous_arg base_msg; *)
(* let opts = *)
(*   !pages |> parse_pages |> create_optional_args_list |> filter_none *)
(* in *)
(* let args = List.rev !anon_args in *)
(* execute args opts *)
