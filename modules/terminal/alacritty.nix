{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ alacritty ];

  xdg.configFile = {
    "alacritty/alacritty.yml" = {
      text = (builtins.readFile ../../dotfiles/alacritty/alacritty.yml);
    };
  };
}
