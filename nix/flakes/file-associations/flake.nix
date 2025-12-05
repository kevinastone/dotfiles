{
  description = "A Home Manager module to manage file associations using duti";

  outputs =
    { self, ... }:
    {
      # The standard convention for exporting HM modules
      homeManagerModules = {
        default = self.homeManagerModules.file-associations;
        file-associations = import ./file-associations.nix;
      };
    };
}
