{ pkgs, ... }:
{
  imports = [
    # keep-sorted start
    ./k8s
    ./siege.nix
    # keep-sorted end
  ];

  home.packages = with pkgs; [
    (arping.overrideAttrs (old: rec {
      version = "2.26";

      src = fetchFromGitHub {
        inherit (old.src) owner repo;
        rev = "arping-${version}";
        hash = "sha256-uZsUo12ez6sz95fmOg5cmVBJNRH3eEhio8V2efQ29BU=";
      };
    }))
    # alternative vnc-viewer (remote-viewer)
    virt-viewer
  ];
}
