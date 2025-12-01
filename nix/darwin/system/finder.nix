{...}: {
  system.defaults.finder = {
    ShowPathbar = true;
    ShowHardDrivesOnDesktop = true;
    ShowExternalHardDrivesOnDesktop = true;

    # Search scope
    # This Mac       : `SCev`
    # Current Folder : `SCcf`
    # Previous Scope : `SCsp`
    FXDefaultSearchScope = "SCcf";

    # New window target
    NewWindowTarget = "Home";
  };
}
