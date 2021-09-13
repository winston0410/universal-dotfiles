_:
{ pkgs, config, ... }: {
  dotfiles.terminal.shell = {
    enable = true;
    package = pkgs.nushell;
    configPath = ../../dotfiles/nu/config.toml;
  };
}
