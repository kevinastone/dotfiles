{
  config,
  lib,
  username,
  pkgs,
  ...
}:
let
  # profileDirectory = config.home-manager.users."${username}".home.profileDirectory;
  # resolveExecutableBasename = item:
  #   if lib.isString item then
  #     item
  #   else
  #     item.meta.mainProgram;
  # executables = map resolveExecutableBasename config.home-manager.users."${username}".sudo.nopasswd-executables;
  paths = config.home-manager.users."${username}".sudo.nopasswd.paths;
in
lib.mkIf (paths != [ ]) {
  security.sudo.extraConfig = lib.concatMapStrings (
    path: "%admin ALL=(ALL) NOPASSWD: ${path}\n"
  ) paths;
}
