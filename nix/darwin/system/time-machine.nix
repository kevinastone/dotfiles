{ config, ... }:
let
  username = config.system.primaryUser;
in
{
  system.defaults.CustomSystemPreferences."com.apple.TimeMachine" = {
    SkipPaths = [
      "~${username}/Downloads"
      "~${username}/Documents/Virtualbox VMs"
      "~${username}/.local"
      "~${username}/Movies"
      "~${username}/Applications"
    ];

    RequiresACPower = true;
  };
}
