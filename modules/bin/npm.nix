{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.file = {
    ".npmrc" = {
      text = (builtins.readFile ../../dotfiles/.npmrc) + ''
        # Cache directory for NPM
        cache=${xdg.cacheHome}/npm
        # Cache directory for PNPM
        store-dir=${xdg.cacheHome}/pnpm
        update-notifier=false
      '';
    };

    # Not going to use yarn anymore, but keeping this just in case
    ".yarnrc" = {
      text = ''
        yarn-offline-mirror "${xdg.cacheHome}/.yarn-cache"
        disable-self-update-check true
      '';
    };
  };

  home.sessionVariables = { NODE_REPL_HISTORY = "${xdg.cacheHome}/node_repl_history"; };
}
