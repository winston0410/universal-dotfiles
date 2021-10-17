username:
{ config, lib, pkgs, ... }:

{
  #TODO set DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
  virtualisation.docker.enable = false;
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    defaultNetwork.dnsname.enable = true;
  };

  home-manager.users.${username} = {
    home.packages = with pkgs; [ arion docker-client ];
  };
}
