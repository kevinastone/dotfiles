{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    iperf3
  ]
}
