{
  self,
  ...
}:
{
  imports = [
    ./delta.nix
  ];

  programs.git.enable = true;
  programs.git.ignores = [ ".DS_Store" ];
  # Keep bulk git config external for better re-use
  programs.git.includes = [
    {
      path = self + "/config/git/config";
    }
  ];
  programs.lazygit.enable = true;
}
