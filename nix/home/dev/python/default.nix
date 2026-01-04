{ pkgs, ... }:
let
  pythonPkg = pkgs.python314;
in
{
  home.packages = with pkgs; [
    (pythonPkg.withPackages (
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
