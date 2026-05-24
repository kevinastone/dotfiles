{ lib, ... }:
{
  ignoreHostKeys = {
    StrictHostKeyChecking = "no";
    UserKnownHostsFile = "/dev/null";
  };

  mkHosts = hosts: lib.concatStringsSep " " hosts;
}
