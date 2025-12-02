{ pkgs, ... }: {

  xdg.configFile.flake8 = {
    source = ./flake8;
  };
}
