{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.colima = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    enable = true;
    dockerPackage = pkgs.docker-client;
    profiles.default = {
      isActive = true;
      setDockerHost = true;
      # Set to true to auto-start Colima at login via launchd
      isService = false;
      mutableSettings = true;
      settings = {
        vmType = "vz";
        rosetta = true;
        mountType = "virtiofs";
      };
    };
  };

  programs.ssh.includes = lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
    "~/${config.services.colima.colimaHomeDir}/ssh_config"
  ];
}
