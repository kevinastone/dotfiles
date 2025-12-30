{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        # keep-sorted start
        numpy
        pandas
        # keep-sorted end
      ]
    ))
    uv
  ];
}
