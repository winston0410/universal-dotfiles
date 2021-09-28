{ pkgs, config, ... }:

{
  xdg.configFile = {
    "himalaya/config.toml" = { source = ../../dotfiles/himalaya/config.toml; };
  };

  home.packages = with pkgs; [ himalaya ];

  dotfiles-manager.shellAliases = { mail = "himalaya"; };
}
