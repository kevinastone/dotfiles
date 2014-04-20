export EB_HOME="/Users/kevinstone/eventbrite/core"
export EB_VM_MEMSIZE="4096"
export EB_VG_NFS_VENV="yes"
export EB_VG_SYNC_VENV="yes"

function vg() {

    if [ $1 ]
    then
    	ssh-add
        pushd $EB_HOME/django/scripts/vagrant/vagrant_1.4/
        vagrant $@
        popd
    else
        cd $EB_HOME
    fi
}

type -t _vagrant >/dev/null && complete -F _vagrant vg
