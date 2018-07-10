# source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

if status --is-login; and test -d ~/.opam
    set -x PATH "~/.opam/system/bin" $PATH
    set -x CAML_LD_LIBRARY_PATH "~/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"
    set -x OCAML_TOPLEVEL_PATH "~/.opam/system/lib/toplevel"
end

set -x OPAMUTF8MSGS "1"
