function gssh
    rw -r $USER.c.googlers.com $argv
end

function mgssh
    gssh --gmosh --gmosh_extra_args="--no-init" $argv    
end
