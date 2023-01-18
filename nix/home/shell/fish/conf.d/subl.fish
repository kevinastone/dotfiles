if status --is-login; and test -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin"
    contains "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $fish_user_paths
    or set -x fish_user_paths "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $fish_user_paths
end

