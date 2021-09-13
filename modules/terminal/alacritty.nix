_: { pkgs, config, ... }: {
  dotfiles.terminal.emulator = {
    enable = true;
    package = pkgs.alacritty;
    configPath = ../../dotfiles/alacritty/alacritty.yml;
  };
}
