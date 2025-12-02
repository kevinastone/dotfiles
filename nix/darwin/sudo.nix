{ config, username, pkgs, ... }:
let
  profileDirectory = config.home-manager.users."${username}".home.profileDirectory;
  # executables = config.home-manager.users."${username}".home.sudo.nopasswd-executables;
in {
  security.sudo.extraConfig = ''
    %admin ALL=(ALL) NOPASSWD: ${profileDirectory}/bin/htop
  '';
}
