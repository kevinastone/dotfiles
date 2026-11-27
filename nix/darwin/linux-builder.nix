{ pkgs, ... }:
{
  nix.linux-builder = {
    enable = true;
    package = pkgs.darwin.linux-builder-vz;
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
    maxJobs = 4;
    config.virtualisation.cores = 6;
    config.virtualisation.darwin-builder.memorySize = 8 * 1024; # MiB
  };
}
