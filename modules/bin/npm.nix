{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.file = {
    ".npmrc" = {
      text = (builtins.readFile ../../dotfiles/.npmrc) + ''
        # Cache directory for NPM
        cache=${xdg.cacheHome}/npm
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
}
