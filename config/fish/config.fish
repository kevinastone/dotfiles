if status --is-login
    set -x PATH ~/.bin $PATH
end

if status --is-login; and test -d ~/.local/bin
    set -x PATH ~/.local/bin $PATH
end
