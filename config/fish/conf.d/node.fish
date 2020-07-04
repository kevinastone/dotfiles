if status --is-login
    contains ./node_modules/.bin $fish_user_paths
    or set -x fish_user_paths ./node_modules/.bin $fish_user_paths
end
