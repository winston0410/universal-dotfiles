{ config, lib, pkgs, inputs, system, ... }:

{
  home.packages = [  inputs.deploy-rs.defaultPackage.${system} ];
}
