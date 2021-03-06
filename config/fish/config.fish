contains /usr/local/sbin $fish_user_paths
or set -x fish_user_paths /usr/local/sbin $fish_user_paths

if status --is-login
    contains $HOME/.bin $fish_user_paths
    or set -x fish_user_paths $HOME/.bin $fish_user_paths
end

if status --is-login; and test -d ~/.local/bin
    contains $HOME/.local/bin $fish_user_paths
    or set -x fish_user_paths $HOME/.local/bin $fish_user_paths
end
