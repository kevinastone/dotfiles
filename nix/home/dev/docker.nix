{ pkgs, ... }:
{
  programs.docker-cli.enable = true;

  home.packages = with pkgs; [
    docker-client
    docker-compose
    docker-buildx
  ];
}
