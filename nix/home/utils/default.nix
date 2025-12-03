{ pkgs, ... }:
{
  imports = [
    ./tmux
    ./htop.nix
  ];

  home.packages = with pkgs; [
    htop
    httpie
    iperf
    iperf3
    moreutils
    ripgrep
  ];

  programs.bat.enable = true;
  programs.broot.enable = true;
}
