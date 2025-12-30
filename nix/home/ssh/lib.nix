{ lib, ... }:
{
  ignoreHostKeys = {
    extraOptions.StrictHostKeyChecking = "no";
    userKnownHostsFile = "/dev/null";
  };

  mkHosts = hosts: lib.concatStringsSep " " hosts;
}
