# Base16 Shell
if status --is-interactive; and test -d "$HOME/.config/base16-shell"
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
