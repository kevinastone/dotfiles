{ pkgs, ... }:
{
  programs.zed-editor = {
    extraPackages = with pkgs; [
      nil
      nixd
    ];

    userSettings = {
      languages.Nix = {
        language_servers = [
          "nil"
          "nixd"
        ];
        formatter.external.command = "nixfmt";
      };
    };
  };
}
