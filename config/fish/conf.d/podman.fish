if type -q podman
    alias docker="podman"

    if type -q podman-compose
        alias docker-compose="podman-compose"
    end
end
