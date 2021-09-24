username:
{ pkgs, config, ... }: {
  services.xserver = {
    windowManager.leftwm = { enable = true; };
    displayManager = { defaultSession = "none+leftwm"; };
  };

  home-manager.users.${username} = {
    home.packages = [ pkgs.feh pkgs.leftwm ];
    xdg.configFile = {
      "leftwm/themes/current/" = {
        source = ../../dotfiles/leftwm/themes/current;
      };

      "leftwm/config.toml" = {
        source = ../../dotfiles/leftwm/config.toml;
      };
    };
  };
}
