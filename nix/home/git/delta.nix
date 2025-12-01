{
  pkgs,
  lib,
  config,
  systemSettings,
  ...
}: {

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    enableJujutsuIntegration = true;
    options = {
      navigate = true;
    };
  };
}
