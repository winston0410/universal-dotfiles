username:
{ pkgs, config, ... }: {
  # dotfiles.xserver.bar = {
  # enable = false;
  # package = pkgs.eww;
  # };

  home-manager.users.${username} = { home.packages = [ pkgs.eww ]; };
}
