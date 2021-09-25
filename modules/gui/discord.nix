{ pkgs, ... }:

{
  home.packages = with pkgs; [ discord ];

  xdg.configFile = {
    "discord/settings.json" = {
      source = ../../dotfiles/discord/settings.json;
    };
  };
}
