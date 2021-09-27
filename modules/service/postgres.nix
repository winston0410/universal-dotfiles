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
    home.sessionVariables = {
      PSQLRC = "${xdg.configHome}/pg/psqlrc";
      PSQL_HISTORY = "${xdg.cacheHome}/pg/psql_history";
      PGPASSFILE = "${xdg.cacheHome}/pg/pgpass";
      PGSERVICEFILE = "${xdg.cacheHome}/pg/pg_service.conf";
    };

    xdg.configFile = { "pg/" = { source = ../../dotfiles/pg; }; };
  };
}
