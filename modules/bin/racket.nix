{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = {
    PLTUSERHOME = "${xdg.cacheHome}/racket";
  };
}
