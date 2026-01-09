{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./k8s
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    arping
    siege
    # alternative vnc-viewer (remote-viewer)
    virt-viewer
  ];
}
