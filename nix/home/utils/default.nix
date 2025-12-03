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
    jq
    moreutils
    mosh
    ripgrep
  ];

  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.btop.enable = true;
}
