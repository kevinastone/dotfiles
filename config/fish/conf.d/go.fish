set -x GOPATH ~/.go

if status --is-login; and test -d $GOPATH/bin
    set -x fish_user_paths $GOPATH/bin $fish_user_paths
end
