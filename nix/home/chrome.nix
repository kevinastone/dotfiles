{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = with pkgs; google-chrome;
  };
}
