_: {
  imports = [
    # keep-sorted start
    ./k8s.nix
    ./local.nix
    ./raspi.nix
    ./unifi.nix
    ./vnc.nix
    ./vpn.nix
    # keep-sorted end
  ];

  programs.ssh.enable = true;
  programs.ssh.enableDefaultConfig = false;
}
