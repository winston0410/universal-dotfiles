{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile ../../dotfiles/.zshrc);
  };
}
