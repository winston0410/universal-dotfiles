username:
{ config, lib, pkgs, ... }:

{
  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:4000";
    port = 4000;
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [ ];
    useSubstitutes = true;
  };
}
