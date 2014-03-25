export EB_HOME="/Volumes/eb_home/work/eventbritecore/"

function vg() {

   if [ $1 ]
   then
       pushd $EB_HOME/django/scripts/vagrant/vagrant_1.4/
       vagrant $@
       popd
   else
       pushd $EB_HOME
   fi
}

complete -F _vagrant vg
