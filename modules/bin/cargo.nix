{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.file = { ".cargo/config.toml" = { text = ""; }; };

  home.sessionVariables = { CARGO_HOME = "${xdg.cacheHome}/cargo"; };
}
