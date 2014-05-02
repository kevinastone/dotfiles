export EB_HOME="/Users/kevinstone/eventbrite/core"
export EB_VM_MEMSIZE="4096"
# export EB_VG_NFS_VENV="yes"
export EB_VG_SYNC_VENV="yes"

export VAGRANT_PATH="$EB_HOME/django/scripts/vagrant/vagrant_1.5"

function __call_vagrant() {

    VAGRANT_CWD="$VAGRANT_PATH" vagrant $@
}

function vg() {

    if [ $1 ]
    then
        case "$1" in
            up|resume|ssh|provision)
                # Add the ssh-key on boot
                ssh-add
            ;;
        	halt|suspend)
                # Need to rsync back before shutdown
                if [ -n "$EB_VG_SYNC_VENV" ]; then
        			vm_name=`vagrant status | grep running | head -1 | cut -f1 -d" "`
                    sync_cmd=`vagrant list-commands | grep rsync-back | head -1 | cut -f1 -d" "`
        			if [[ "$vm_name" != "" && "$sync_cmd" != "" ]]; then
                        __call_vagrant $sync_cmd
        			fi
                fi
			;;
    	esac
        __call_vagrant $@
    else
        cd $EB_HOME
    fi
}

type -t _vagrant >/dev/null && complete -F _vagrant vg
