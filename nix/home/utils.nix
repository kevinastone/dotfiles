{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    htop
    iperf
    iperf3
    moreutils
  ];
}
