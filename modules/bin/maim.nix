{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ maim ];

  dotfiles-manager.shellAliases = {
    screenshot = "maim $HOME/$(date +%s).jpg";
  };
}
