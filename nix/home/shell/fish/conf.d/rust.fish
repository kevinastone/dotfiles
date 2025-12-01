if status --is-login; and test -d ~/.cargo/bin
    contains $HOME/.cargo/bin $fish_user_paths
    or set -x fish_user_paths $HOME/.cargo/bin $fish_user_paths
end
