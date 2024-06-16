module Cmd = Readu_lib.Subcommand
module Util = Readu_lib.Util
module Readu_Init = Readu_lib.Readu_io
module Values = Readu_lib.Values

(* (* let chapters : int option ref = ref None *) *)
(* (* let volumes : int option ref = ref None *) *)
(* (* let volume_chapters : int option ref = ref None *) *)

let handle_subcommands subcmd args options =
  let subcommand = Cmd.parse_subcommand subcmd in
  match subcommand with
  | None -> Printf.printf "Invalid subcommand, please try typing readu --help"
  | Some cmd -> Cmd.execute_subcommand args options cmd

let execute (values : Values.values) =
  match values.args with
  | [] ->
      print_endline "Reau - A Reading list CLI tool. Type --help for options"
  | subcmd :: args -> handle_subcommands subcmd args values.opts

let () =
  Readu_Init.create_readu_if_not_exists ();
  let values = Readu_lib.Values.parse () in
  execute values
