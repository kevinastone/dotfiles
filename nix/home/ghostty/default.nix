{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      confirm-close-surface = false;
      window-inherit-working-directory = false;
      shell-integration-features = "ssh-env";
      bell-features = "no-attention, no-title";
    };
  };
}
