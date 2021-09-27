username:
{ config, lib, pkgs, inputs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.postgresql = { enable = true; };

  home-manager.users.${username} = {
    home.activation = {
      pg-cache-prep = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD mkdir $VERBOSE_ARG -p '${xdg.cacheHome}/pg'
      '';
    };
    xdg.configFile = { "pg/" = { source = ../../dotfiles/pg; }; };
  };
}
