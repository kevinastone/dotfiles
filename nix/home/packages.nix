{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    htop
    iperf3
  ]
}
