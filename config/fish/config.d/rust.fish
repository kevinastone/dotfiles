if status --is-login; and test -d ~/.cargo/bin
    set -x PATH ~/.cargo/bin $PATH
end
