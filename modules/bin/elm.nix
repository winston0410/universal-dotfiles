{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = { ELM_HOME = "${xdg.cacheHome}/elm"; };
}
