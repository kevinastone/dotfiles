_: {
  nixpkgs.overlays = [
    (_final: prev: {
      arping = prev.arping.overrideAttrs (old: rec {
        # Pin arping to 2.26 since they broke macos compatiblity in 2.27
        # (should be fixed in 2.28)
        version = "2.26";

        src = prev.fetchFromGitHub {
          inherit (old.src) owner repo;
          rev = "arping-${version}";
          hash = "sha256-uZsUo12ez6sz95fmOg5cmVBJNRH3eEhio8V2efQ29BU=";
        };
      });
    })
  ];
}
