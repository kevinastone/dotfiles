{ pkgs, ... }:
{
  # Install package directly instead of `programs.discord.enable`, which
  # unconditionally symlinks a read-only settings.json.
  home.packages = with pkgs; [
    discord
  ];
}
