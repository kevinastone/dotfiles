{ pkgs, ... }:
{
  programs.k9s.plugins.dive = {
    shortCut = "d";
    description = "Dive image";
    scopes = [
      "containers"
    ];
    command = "dive";
    background = false;
    args = [
      "$COL-IMAGE"
    ];
  };

  home.packages = with pkgs; [
    dive
  ];
}
