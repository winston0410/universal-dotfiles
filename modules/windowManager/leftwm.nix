username:
{ pkgs, config, ... }: {
  services.xserver = {
    windowManager.leftwm = { enable = true; };
    displayManager = { defaultSession = "none+leftwm"; };
  };

  home-manager.users.${username} = {
    home.packages = with pkgs; [ feh leftwm ];
    xdg.configFile = {
      "leftwm/themes/current" = {
        source = ../../dotfiles/leftwm/themes/current;
      };

      "leftwm/themes/nix-generated" = {
        text = (builtins.readFile ../../dotfiles/leftwm/themes/nix-generated);
      };

      "leftwm/config.toml" = { source = ../../dotfiles/leftwm/config.toml; };
    };
  };
}
