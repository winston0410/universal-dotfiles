{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.activation = {
    redis-cache-prep =
      inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD mkdir $VERBOSE_ARG -p '${xdg.cacheHome}/redis'
      '';
  };
  home.sessionVariables = {
    REDISCLI_HISTFILE = "${xdg.cacheHome}/redis/rediscli_history";
    REDISCLI_RCFILE = "${xdg.configHome}/redis/redisclirc";
  };
}
