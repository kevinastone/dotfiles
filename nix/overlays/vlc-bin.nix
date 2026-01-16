_: {
  nixpkgs.overlays = [
    (_final: prev: {
      vlc-bin = prev.vlc-bin.overrideAttrs (old: {
        version = "3.0.23";

        src = prev.fetchurl {
          inherit (old.src) url;
          hash = "sha256-/G+sCNh/U4UX1ErKDF56JEtnyMTLWJv0eDY6cxX9Xg0=";
        };
      });
    })
  ];
}
