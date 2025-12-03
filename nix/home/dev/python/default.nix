{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        # select Python packages here
        pandas
        numpy
      ]
    ))
    uv
  ];
}
