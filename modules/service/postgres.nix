username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.postgresql = { 
    enable = true; 
    authentication = ''
        local all postgres trust
    '';
    package = pkgs.postgresql_14;
  };
}
