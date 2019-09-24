if status --is-login; and test -d ~/.cargo/bin
    set -x fish_user_paths ~/.cargo/bin $fish_user_paths
end
