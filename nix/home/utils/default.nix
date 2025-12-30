{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./htop.nix
    ./the-unarchiver.nix
    ./tmux
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    # keep-sorted start
    httpie
    iperf
    iperf3
    moreutils
    mosh
    ripgrep
    # keep-sorted end
  ];

  # keep-sorted start
  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.btop.enable = true;
  programs.jq.enable = true;
  # keep-sorted end
}
