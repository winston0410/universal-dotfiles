_:
{ pkgs, config, ... }: {
  dotfiles.terminal.shell = {
    enable = true;
    package = pkgs.zsh;
    configPath = ../../dotfiles/.zshrc;
  };
}
