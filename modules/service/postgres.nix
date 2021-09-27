username:
{ config, lib, pkgs, ... }:

let xdg = config.home-manager.users.${username}.xdg;
in {
  services.postgresql = { enable = true; };

  home.activation = {
    pg-cache-prep = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD mkdir $VERBOSE_ARG -p '${xdg.cacheHome}/pg'
    '';
  };

  home-manager.users.${username} = {
    home.sessionVariables = {
      PSQLRC = "${xdg.configHome}/pg/psqlrc";
      PSQL_HISTORY = "${xdg.cacheHome}/pg/psql_history";
      PGPASSFILE = "${xdg.cacheHome}/pg/pgpass";
      PGSERVICEFILE = "${xdg.cacheHome}/pg/pg_service.conf";
    };
  };

  xdg.configFile = { "pg/" = { source = ../../dotfiles/pg; }; };
}
