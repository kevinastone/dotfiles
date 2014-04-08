export EB_HOME="/Users/kevinstone/eventbrite/core"
export EB_VM_MEMSIZE="4096"
export EB_VG_NFS_VENV="yes"

function vg() {

    if [ $1 ]
    then
        pushd $EB_HOME/django/scripts/vagrant/vagrant_1.4/
        vagrant $@
        popd
    else
        cd $EB_HOME
    fi
}

complete -F _vagrant vg
