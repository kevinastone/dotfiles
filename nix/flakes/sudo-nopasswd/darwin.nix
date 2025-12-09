{
  config,
  lib,
  ...
}:
let
  mkRule = path: "%admin ALL=(ALL) NOPASSWD: ${path}";
  paths = lib.concatMap (cfg: cfg.sudo.nopasswd.paths or [ ]) (
    lib.attrValues config.home-manager.users
  );
  rules = map mkRule paths;
in
lib.mkIf (config ? home-manager && rules != [ ]) {
  security.sudo.extraConfig = lib.concatStringsSep "\n" rules;
}
