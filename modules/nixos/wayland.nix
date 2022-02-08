username:
{ config, lib, pkgs, inputs, ... }:

let

#NOTE Wayland is not really usable for now
#REF https://nixos.wiki/wiki/Sway
#REF https://github.com/Smithay/smithay
#REF https://github.com/leftwm/leftwm/issues/492
in {
  environment.systemPackages = with pkgs; [ wl-clipboard ];
}
