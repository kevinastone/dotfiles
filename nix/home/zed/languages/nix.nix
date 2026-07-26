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
        format_on_save = "on";
        formatter.external = {
          command = "nixfmt";
          arguments = [ "{buffer_path}" ];
        };
      };
    };
  };
}
