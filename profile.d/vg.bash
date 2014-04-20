export EB_HOME="/Users/kevinstone/eventbrite/core"
export EB_VM_MEMSIZE="4096"
export EB_VG_NFS_VENV="yes"
export EB_VG_SYNC_VENV="yes"

function vg() {

    if [ $1 ]
    then
        pushd $EB_HOME/django/scripts/vagrant/vagrant_1.4/
        case "$1" in
            up|resume|ssh|provision)
                # Add the ssh-key on boot
                ssh-add
            ;;
        	halt|suspend)
                # Need to rsync back before shutdown
    			vm_name=`vagrant status | grep running | head -1 | cut -f1 -d" "`
                sync_cmd=`vagrant list-commands | grep rsync-back | head -1 | cut -f1 -d" "`
    			if [[ "$vm_name" != "" && "$sync_cmd" != "" ]]; then
    				vagrant $sync_cmd
    			fi
			;;
    	esac
        vagrant $@
        popd
    else
        cd $EB_HOME
    fi
}

type -t _vagrant >/dev/null && complete -F _vagrant vg
