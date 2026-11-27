{ config, ... }:
let
  home = config.users.users.${config.system.primaryUser}.home;
in
{
  system.defaults.CustomSystemPreferences."com.apple.TimeMachine" = {
    SkipPaths = [
      "${home}/Downloads"
      "${home}/Documents/Virtualbox VMs"
      "${home}/.local"
      "${home}/Movies"
      "${home}/Applications"
    ];

    RequiresACPower = true;
  };
}
