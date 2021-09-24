{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ tmux ];

  home.file = {
    ".tmux.conf" = { text = (builtins.readFile ../../dotfiles/.tmux.conf); };
  };
}
