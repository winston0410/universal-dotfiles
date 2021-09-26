{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = {
    DENO_DIR = "${xdg.cacheHome}/deno-cache";
    DENO_INSTALL_ROOT = "${xdg.cacheHome}/deno";
  };
}
