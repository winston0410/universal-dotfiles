{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  # Not sure how to change the path for cargo configuration file to .config
  # home.file = { ".cargo/config.toml" = { text = ""; }; };

  home.sessionVariables = { CARGO_HOME = "${xdg.cacheHome}/cargo"; };
}
