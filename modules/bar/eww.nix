username:
{ pkgs, config, ... }: {
  dotfiles.xserver.bar = {
    enable = true;
    package = pkgs.eww;
  };
}
