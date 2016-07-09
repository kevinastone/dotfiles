set -x EDITOR vim

if status --is-login
    set -x PATH ~/.bin ~/.local/bin $PATH
end

ulimit -n 4096

# Fish Completions
if test -d /usr/local/share/fish/vendor_completions.d
    set -x fish_complete_path $fish_complete_path /usr/local/share/fish/vendor_completions.d
end

# Config.d
for conf in $HOME/.config/fish/config.d/**.fish
    source $conf
end
