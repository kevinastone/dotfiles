
function vssh --description "SSH into Vagrant"
    cd ~/eventbrite/docker-dev
    test -d .vagrant
    or begin
        echo "No Vagrantfile found" 1>&2
        return 3
    end

    set VM_NAME (basename .vagrant/machines/*)

    /usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config | grep --extended-regexp --silent "^$VM_NAME\$"
    and begin
        ssh -t $VM_NAME $argv

        if test $status -ne 255
            # Connection succeeded, exit...
            return $status
        end
    end

    # Finally, resort to `vagrant ssh`
    if test -z "$argv"
        vagrant ssh
    else
        vagrant ssh --command="$argv" -- -t
    end
end
