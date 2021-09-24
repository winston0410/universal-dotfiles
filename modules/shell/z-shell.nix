{ pkgs, config, ... }: {
  home.packages = [ pkgs.zsh ];

  home.file = {
    ".zshrc" = { text = (builtins.readFile ../../dotfiles/.zshrc); };
  };
}
