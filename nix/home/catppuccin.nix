{
  catppuccin,
  ...
}:
{
  imports = [
    catppuccin.homeModules.catppuccin
  ];

  catppuccin = rec {
    enable = true;
    autoEnable = enable;
    flavor = "mocha";
  };
}
