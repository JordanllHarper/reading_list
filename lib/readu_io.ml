let create_readu_if_not_exists () =
  let path = Util.readu_path in
  if not (Sys.file_exists path) then
    try Sys.mkdir path 0o777 with
    | Not_found ->
        prerr_endline
          "HOME environment variable not found. Please set your home \
           environment variable before running readu again."
    | _ -> prerr_endline "Something else went wrong :("
