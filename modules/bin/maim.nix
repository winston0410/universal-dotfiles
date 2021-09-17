username:
{ pkgs, config, ... }:

{
  home-manager.users.${username} = { home.packages = with pkgs; [ maim ]; };

  dotfiles.terminal.shell.aliases = {
    screenshot = "maim $HOME/screenshot/$(date +%s).jpg";
  };
}
