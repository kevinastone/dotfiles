if status --is-login; and test -d ./node_modules/.bin
    set -x PATH ./node_modules/.bin $PATH
end
