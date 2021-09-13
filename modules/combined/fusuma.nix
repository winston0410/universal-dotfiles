{ pkgs, ... }:

{
  xdg.configFile = {
    "fusuma/" = { source = "../../dotfiles/fusuma"; };
  };
}
