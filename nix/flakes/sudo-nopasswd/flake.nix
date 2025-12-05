{
  description = "A Home Manager module + Darwin module to add programs to the sudoers file with nopasswd";

  outputs =
    { self, ... }:
    {
      # The standard convention for exporting HM modules
      homeManagerModules = {
        default = self.homeManagerModules.sudo-nopasswd;
        sudo-nopasswd = import ./hm.nix;
      };
      # The standard convention for exporting HM modules
      darwinModules = {
        default = self.darwinModules.sudo-nopasswd;
        sudo-nopasswd = import ./darwin.nix;
      };
    };
}
