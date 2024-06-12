(lang dune 3.15)

(name readu)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Jordan Harper")

(maintainers "Jordan Harper")

(license MIT)

(package
 (name readu)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune yojson)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
