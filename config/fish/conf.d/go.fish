set -x GOPATH ~/.go

if status --is-login; and test -d $GOPATH/bin
    contains $GOPATH/bin $fish_user_paths
    or set -x fish_user_paths $GOPATH/bin $fish_user_paths
end
