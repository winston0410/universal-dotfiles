{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = {
    MIX_HOME = "${xdg.cacheHome}/mix";
    HEX_HOME = "${xdg.cacheHome}/hex";
  };
}
