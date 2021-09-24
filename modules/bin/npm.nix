{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.file = {
    ".npmrc" = {
      text = (builtins.readFile ../../dotfiles/.npmrc) + ''
        # Cache directory for NPM
        cache=${xdg.cacheHome}/npm
      '';
    };
  };
}
