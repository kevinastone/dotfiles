{
  config,
  lib,
  ...
}:
let
  casks = lib.flatten (
    lib.mapAttrsToList (_user: userConfig: userConfig.homebrew.casks or [ ]) config.home-manager.users
  );
in
lib.mkIf (config ? home-manager && casks != [ ]) {
  homebrew.casks = casks;
}
