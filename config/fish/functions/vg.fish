set -x EB_HOME "/Users/kevinstone/eventbrite/core"

set VAGRANT_PATH "$EB_HOME/django/scripts/vagrant/vagrant_1.5"

function __call_vagrant
    pushd $VAGRANT_PATH
    vagrant $argv
    popd
end

function start_selenium
    pushd $VAGRANT_PATH
    /usr/bin/java -jar ../../../src/www/eventbrite/common/automation/webdriver/server/selenium-server-standalone-2.41.0.jar -trustAllSSLCertificates &
    popd
end

function vg

    set -q argv[1]
    and begin
    	set -l command $argv[1]
        switch $command
        	case plugins
                pushd $VAGRANT_PATH
                ./manage_plugins.py
                exit
            case up resume ssh reload provision
                # Add the ssh-key on boot
                ssh-add
            case halt suspend
                # Need to rsync back before shutdown
                # if [ -n "$EB_VG_SYNC_VENV" ]; then
                #     vm_name=( __call_vagrant status ) | grep running | head -1 | cut -f1 -d" "
                #     sync_cmd=( __call_vagrant list-commands ) | grep rsync-back | head -1 | cut -f1 -d" "
                #     if [[ "$vm_name" != "" && "$sync_cmd" != "" ]]; then
                #         __call_vagrant $sync_cmd
                #     fi
                # fi
        end
        switch $command
        	case up
                pushd $VAGRANT_PATH
                ./manage_plugins.py
        end

        __call_vagrant $argv

        switch $command
            case up
                test -e ~/.vagrant.d/plugins.json; and rm ~/.vagrant.d/plugins.json
        end
    end
    or cd $EB_HOME
end

# type -t _vagrant >/dev/null && complete -F _vagrant vg
