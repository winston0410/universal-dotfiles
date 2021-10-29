username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.postgresql = { 
    enable = true; 
    authentication = lib.mkForce ''
        local all postgres trust
    '';
  };
}
