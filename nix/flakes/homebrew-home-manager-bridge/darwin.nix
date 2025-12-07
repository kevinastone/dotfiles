{
  config,
  lib,
  ...
}:
let
  casks = lib.flatten (
    lib.mapAttrsToList (_user: userConfig: userConfig.homebrew.casks or [ ]) config.home-manager.users
  );
  masApps = lib.mergeAttrsList (
    lib.mapAttrsToList (_user: userConfig: userConfig.homebrew.masApps or [ ]) config.home-manager.users
  );
in
lib.mkIf (config ? home-manager) {
  homebrew = {
    casks = lib.mkIf (casks != [ ]) casks;
    masApps = lib.mkIf (masApps != { }) masApps;
  };
}
