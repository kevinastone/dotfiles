{ pkgs, ... }:
{
  imports = [
    ./node
  ];

  home.packages = with pkgs; [
    prettier
    typescript
  ];
}
