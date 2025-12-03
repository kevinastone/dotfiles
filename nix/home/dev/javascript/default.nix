{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    prettier
    typescript
    yarn
  ];
}
