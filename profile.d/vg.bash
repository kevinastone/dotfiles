export EB_HOME="/Users/kevinstone/eventbrite/core"
export EB_VM_MEMSIZE="4096"
# export EB_VG_NFS_VENV="yes"
export EB_VG_SYNC_VENV="yes"

VAGRANT_PATH="$EB_HOME/django/scripts/vagrant/vagrant_1.5"

function __call_vagrant() {
    pushd $VAGRANT_PATH
    vagrant $@
    popd
    # VAGRANT_CWD="$VAGRANT_PATH" vagrant $@
}

function start_selenium() {
    pushd $VAGRANT_PATH
    /usr/bin/java -jar ../../../src/www/eventbrite/common/automation/webdriver/server/selenium-server-standalone-2.41.0.jar -trustAllSSLCertificates &
    popd
}

function vg() {

    if [ $1 ]
    then
        case "$1" in
            plugins)
                pushd $VAGRANT_PATH
                ./manage_plugins.py
                exit
            ;;
            up|resume|ssh|reload|provision)
                # Add the ssh-key on boot
                ssh-add
            ;;
            halt|suspend)
                # Need to rsync back before shutdown
                if [ -n "$EB_VG_SYNC_VENV" ]; then
                    vm_name=( __call_vagrant status ) | grep running | head -1 | cut -f1 -d" "
                    sync_cmd=( __call_vagrant list-commands ) | grep rsync-back | head -1 | cut -f1 -d" "
                    if [[ "$vm_name" != "" && "$sync_cmd" != "" ]]; then
                        __call_vagrant $sync_cmd
                    fi
                fi
            ;;
        esac
        case "$1" in
            up)
                pushd $VAGRANT_PATH
                ./manage_plugins.py
            ;;
        esac

        __call_vagrant $@

        case "$1" in
            up)
                rm ~/.vagrant.d/plugins.json
            ;;
        esac
    else
        cd $EB_HOME
    fi
}

type -t _vagrant >/dev/null && complete -F _vagrant vg
