{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    docker-buildx
  ];

  programs.docker-cli.enable = true;
}
