{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = { GRADLE_USER_HOME = "${xdg.cacheHome}/gradle"; };
}
