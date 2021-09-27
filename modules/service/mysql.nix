username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
  };

  home-manager.users.${username} = {
    home.activation = {
      mysql-cache-prep =
        inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD mkdir $VERBOSE_ARG -p '${xdg.cacheHome}/mysql'
        '';
    };
    home.sessionVariables = {
      MYSQL_HISTFILE = "${xdg.cacheHome}/mysql/history";
    };
  };
}
