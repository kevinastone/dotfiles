{
  lib,
  pkgs,
  onepassword-shell-plugins,
  ...
}:
{
  imports = [
    onepassword-shell-plugins.hmModules.default
  ];

  # Only linux can be installed via nixpkgs
  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs._1password-gui
    pkgs._1password-cli
  ];

  # Use homebrew for MacOS
  homebrew.casks = lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
    "1password"
    "1password-cli"
  ];

  homebrew.masApps = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    "1Password for Safari" = 1569813296;
  };

  programs._1password-shell-plugins.enable = true;
  # programs._1password-shell-plugins.plugins = with pkgs; [];
}
