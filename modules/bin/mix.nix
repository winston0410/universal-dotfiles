{ pkgs, config, ... }:

let xdg = config.xdg;
in { home.sessionVariables = { MIX_HOME = "${xdg.cacheHome}/mix"; }; }