if status --is-login
    fish_add_path $HOME/.bin
end

if status --is-login; and test -d ~/.local/bin
    fish_add_path $HOME/.local/bin
end
