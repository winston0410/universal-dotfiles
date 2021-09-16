username:
{ pkgs, config, ... }: {
  dotfiles.xserver.bar = {
    enable = false;
    package = (pkgs.callPackage ./eww_derivation.nix {});
  };

  # home-manager.users.${username} = {
  # home.packages = [ pkgs.feh ];
  # xdg.configFile = {
  # "leftwm/themes/current/" = {
  # source = ../../dotfiles/leftwm/themes/current;
  # };
  # };
  # };
}
