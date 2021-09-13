username: { config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
    kubernix
  ];
}
