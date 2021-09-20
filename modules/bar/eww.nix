username:
{ pkgs, config, ... }: {
  dotfiles.xserver.bar = {
    enable = false;
    package = pkgs.eww;
  };
}
