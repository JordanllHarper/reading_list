type values = { args : string list; opts : int option list }

let base_msg = "readu [command]"
let anon_args = ref []
let pages = ref (-1)

(* Spec *)
let speclist =
  [ ("-pages", Arg.Int (fun p -> pages := p), "Set the number of pages") ]

let append_anonymous_arg arg = anon_args := arg :: !anon_args

let create_optional_args_list pages =
  let options = [] in
  pages :: options

let parse_pages deref_pages = if deref_pages < 1 then None else Some deref_pages

let parse () =
  Arg.parse speclist append_anonymous_arg base_msg;
  let opts =
    !pages |> parse_pages |> create_optional_args_list |> Util.filter_none
  in
  let args = List.rev !anon_args in
  { args; opts }
