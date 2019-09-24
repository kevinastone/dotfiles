if status --is-login
    set -x fish_user_paths ~/.bin $fish_user_paths
end

if status --is-login; and test -d ~/.local/bin
    set -x fish_user_paths ~/.local/bin $fish_user_paths
end
