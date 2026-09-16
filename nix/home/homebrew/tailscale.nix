{ pkgs, lib, ... }: {
  homebrew.casks = lib.optionals pkgs.stdenv.hostPlatform.isDarwin [ "tailscale-app" ];

  home.shellAliases = lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
  };
}
