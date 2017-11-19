set -x GOPATH ~/.go

if status --is-login; and test -d $GOPATH/bin
    set -x PATH $GOPATH/bin $PATH
end
