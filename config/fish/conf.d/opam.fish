# source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

if status --is-login; and test -d ~/.opam
    contains "$HOME/.opam/system/bin" $fish_user_paths
    or set -x fish_user_paths "$HOME/.opam/system/bin" $fish_user_paths
    set -x CAML_LD_LIBRARY_PATH "~/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"
    set -x OCAML_TOPLEVEL_PATH "~/.opam/system/lib/toplevel"
end

set -x OPAMUTF8MSGS "1"
