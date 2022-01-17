username:
{ config, lib, pkgs, ... }:

{
  #TODO set DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
  # virtualisation.docker.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
    dockerCompat = true;
    defaultNetwork.dnsname.enable = true;
  };
  
  # home-manager.users.${username} = {
    # home.packages = with pkgs; [ arion docker-client ];
  # };
  
  # virtualisation.docker = {
    # enable = true;
  # };

  # home-manager.users.${username} = {
    # home.packages = with pkgs; [ arion ];
  # };
}
