{
  description = "A Home Manager module + Darwin module to allow home-manager modules to modify hombrew";

  outputs =
    { self, ... }:
    {
      # The standard convention for exporting HM modules
      homeManagerModules = {
        default = self.homeManagerModules.homebrew;
        homebrew = import ./hm.nix;
      };
      # The standard convention for exporting HM modules
      darwinModules = {
        default = self.darwinModules.homebrew-home-manager;
        homebrew-home-manager = import ./darwin.nix;
      };
    };
}
