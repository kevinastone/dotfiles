{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    yarn
  ];

  home.file.".eslintrc.json".source = ./eslintrc.json;
}
