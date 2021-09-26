{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  xdg.configFile = {
    "pip/pip.conf" = {
      source = ../../dotfiles/pip/pip.conf;
    };
  };
}
