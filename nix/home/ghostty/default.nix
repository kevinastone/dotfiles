{ pkgs, ... }:
let
  ghosttyPkg = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;
in
{
  programs.ghostty = {
    enable = true;
    package = ghosttyPkg;
    settings = {
      confirm-close-surface = false;
      window-inherit-working-directory = false;
      shell-integration-features = "ssh-env";
      bell-features = "no-attention, no-title";
    };
  };
}
