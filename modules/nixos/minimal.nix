username:
{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = with pkgs; linuxPackages_latest;

  nixpkgs.config = { allowUnfree = true; };

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Europe/London";

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  console = { useXkbConfig = true; };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    binaryCaches = [ "https://cache.nixos.org" ];
    trustedBinaryCaches = [ "http://cache.nixos.org" "http://hydra.nixos.org" ];
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  networking = {
    useDHCP = false;
    firewall = { enable = false; };
    networkmanager = { enable = true; };
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
    scsiLinkPolicy = "min_power";
  };

  hardware.trackpoint = {
    enable = true;
    speed = 250;
  };

  hardware.video = { hidpi = { enable = true; }; };

  programs.light = { enable = true; };

  system.stateVersion = "21.05";

  users = {
    mutableUsers = false;
    groups = { docker = { }; };
    users.hugosum = {
      isNormalUser = true;
      home = "/home/hugosum";
      extraGroups =
        [ "wheel" "networkmanager" "docker" "input" "video" "audio" "sound" ];
      hashedPassword =
        "$6$pHSJA2UTMz$Z5IS7T6E67bshhmPfcAQRRKgbEuOelR23SiB5Os0YqUqX.oDl5P/nhnKbSAYmiU1mHn01tJ90HD11dYQpg1iN0";
    };
  };

  environment.systemPackages = with pkgs; [ git ];

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };
}
