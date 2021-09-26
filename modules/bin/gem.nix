{ pkgs, config, ... }:

let
  xdg = config.xdg;
  gemHome = "${xdg.cacheHome}/gem";
in {
  home.sessionVariables = {
    GEM_HOME = gemHome;
    GEM_PATH = "$GEM_PATH:${gemHome}";
  };
}
