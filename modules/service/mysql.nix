username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
  };
}
