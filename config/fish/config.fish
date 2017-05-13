if status --is-login
    set -x PATH ~/.bin $PATH
end

if status --is-login; and test -d ~/.local/bin
    set -x PATH ~/.local/bin $PATH
end

# Fish Completions
if test -d /usr/local/share/fish/vendor_completions.d
    set -x fish_complete_path $fish_complete_path /usr/local/share/fish/vendor_completions.d
end
