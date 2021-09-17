username:
{ pkgs, config, ... }:

{
  home-manager.users.${username} = { home.packages = with pkgs; [ maim ]; };

  dotfiles.terminal.shell.aliases = {
    screenshot = "mkdir -p $HOME/screenshot; maim $HOME/screenshot/$(date +%s).jpg";
  };
}
