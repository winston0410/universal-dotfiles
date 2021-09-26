{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = {
    CABAL_DIR = "${xdg.cacheHome}/cabal";
    CABAL_CONFIG = "${xdg.cacheHome}/cabal/config";
    STACK_ROOT = "${xdg.cacheHome}/stack";
  };
}
