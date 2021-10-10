{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    forwardX11 = true;
    banner = ''
    '';
  };
}
