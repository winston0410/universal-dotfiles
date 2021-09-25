{ pkgs, config, ... }:

{
  xdg.configFile = {
    "nvim/init.lua" = { source = ../../dotfiles/nvim/init.lua; };
    "nvim/plugins" = { source = ../../dotfiles/nvim/plugins; };
    "nvim/ftplugin" = { source = ../../dotfiles/nvim/ftplugin; };
    "nvim/ftdetect" = { source = ../../dotfiles/nvim/ftdetect; };
  };

  home.packages = with pkgs; [ neovim ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  dotfiles-manager.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    vimdiff = "nvim -d";
  };
}
