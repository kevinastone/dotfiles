if status --is-login; and test -e ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
end
