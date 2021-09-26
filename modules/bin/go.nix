{ pkgs, config, ... }:

let xdg = config.xdg;
in { home.sessionVariables = { GOPATH = "${xdg.cacheHome}/go"; }; }
