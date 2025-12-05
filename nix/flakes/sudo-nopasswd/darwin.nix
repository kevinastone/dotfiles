{
  config,
  lib,
  ...
}:
let
  mkRule = path: "%admin ALL=(ALL) NOPASSWD: ${path}";
  rules = lib.mapAttrsToList (
    _user: userConfig:
    let
      paths = userConfig.sudo.nopasswd.paths or [ ];
    in
    if paths == [ ] then "" else lib.concatMapStringsSep "\n" mkRule paths
  ) config.home-manager.users;
in
lib.mkIf (config ? home-manager && rules != [ ]) {
  security.sudo.extraConfig = lib.concatStringsSep "\n" rules;
}
