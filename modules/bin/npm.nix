{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  xdg.configFile = {
    "npm/npmrc" = {
      text = (builtins.readFile ../../dotfiles/npm/npmrc) + ''
        prefix="${xdg.dataHome}/npm
        # Cache directory for NPM
        cache=${xdg.cacheHome}/npm
        # Cache directory for PNPM
        store-dir=${xdg.cacheHome}/pnpm
        update-notifier=false
      '';
    };

    # Not going to use yarn anymore, but keeping this just in case
    "yarn/yarnrc" = {
      text = ''
        yarn-offline-mirror "${xdg.cacheHome}/yarn"
        disable-self-update-check true
      '';
    };
  };

  home.sessionVariables = {
    NPM_CONFIG_USERCONFIG = "${xdg.configHome}/npm/npmrc";
    NODE_REPL_HISTORY = "${xdg.cacheHome}/node_repl_history";
  };

  dotfiles-manager.shellAliases = {
    yarn = ''yarn --use-yarnrc "${xdg.configHome}/yarn/yarnrc"'';
  };
}
