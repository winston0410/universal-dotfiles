username:
{ pkgs, config, ... }:

{
  home-manager.users.${username} = {
    xdg.configFile = {
      "nvim/init.lua" = { source = ../../dotfiles/nvim/init.lua; };
      "nvim/plugins" = { source = ../../dotfiles/nvim/plugins; };
      "nvim/ftplugin" = { source = ../../dotfiles/nvim/ftplugin; };
      "nvim/ftdetect" = { source = ../../dotfiles/nvim/ftdetect; };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    home.packages = with pkgs; [ neovim ];
  };

  dotfiles.terminal.shell.aliases = {
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };
}
