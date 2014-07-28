shopt -s huponexit

function _get_vagrant_name() {
    basename .vagrant/machines/*
}

function _get_ssh_hosts() {
    /usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config
}

function _vm_in_ssh() {
    _get_ssh_hosts | grep --extended-regexp --silent "^$1$"
}

function vssh() {
    COMMAND="$*"

    VM_NAME=`_get_vagrant_name`
    _vm_in_ssh $VM_NAME
    HAS_SSH=$?
    if [ $HAS_SSH -eq 0 ]
    then
        ssh -t $VM_NAME $COMMAND
        if [ $? -ne 255 ]
        then
            # Connection succeeded, exit...
            return $?
        fi
    fi

    # Finally, resort to `vagrant ssh`
    if [ -z "$COMMAND" ]
    then
        vagrant ssh
    else
        echo $COMMAND
        vagrant ssh --command="$COMMAND" -- -t
    fi
}
