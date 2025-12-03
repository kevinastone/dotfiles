{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    httpie
    iperf
    iperf3
    moreutils
    ripgrep
  ];
}
