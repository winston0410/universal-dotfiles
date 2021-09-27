username:
{ config, lib, pkgs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.mysql = { enable = true; };

  home-manager.users.${username} = {
    home.sessionVariables = {
      MYSQL_HISTFILE = "${xdg.cacheHome}/mysql_history";
    };
  };
}
