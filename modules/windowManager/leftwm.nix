username:
{ pkgs, config, ... }: {
  dotfiles.terminal.windowManager = {
    enable = true;
    package = pkgs.leftwm;
    configPath = ../../dotfiles/leftwm/config.toml;
  };

  home-manager.users.${username} = {
    xdg.configFile = {
      "leftwm/themes/current" = {
        source = ../../dotfiles/leftwm/themes/current;
      };
    };
  };
}
