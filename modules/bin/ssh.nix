{ config, lib, pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/ssh.nix
  programs.ssh = {
    enable = true;
    compression = true;
    userKnownHostsFile = "~/.ssh/known_hosts";
    extraConfig = "";
    matchBlocks = { };
  };
}
