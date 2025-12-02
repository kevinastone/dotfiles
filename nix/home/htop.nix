{ pkgs, osConfig, ...}: {
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;
}
