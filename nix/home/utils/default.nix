{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./htop.nix
    ./tmux
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    htop
    httpie
    iperf
    iperf3
    jq
    moreutils
    mosh
    ripgrep
    # keep-sorted end
  ];

  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.btop.enable = true;
}
