set -x EDITOR vim

if status --is-login
    set -x PATH ~/.bin ~/.local/bin $PATH
end

ulimit -n 4096

# Config.d
for conf in $HOME/.config/fish/config.d/**.fish
    source $conf
end
