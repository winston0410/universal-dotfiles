username:
{ config, lib, pkgs, ... }:

{

  home-manager.users.${username} = {
    programs.direnv = {
      enable = true;
    };
  };
}
