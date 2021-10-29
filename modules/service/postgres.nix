username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.postgresql = { 
    enable = true; 
    authentication = ''
        local all postgres trust
        host  all all 127.0.0.1/32 trust
        host  all all ::1/128      trust
    '';
    package = pkgs.postgresql_14;
  };
}
