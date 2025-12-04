{
  config,
  lib,
  username,
  ...
}:
let
  inherit (config.home-manager.users."${username}".sudo.nopasswd) paths;
in
lib.mkIf (paths != [ ]) {
  security.sudo.extraConfig = lib.concatMapStrings (
    path: "%admin ALL=(ALL) NOPASSWD: ${path}\n"
  ) paths;
}
