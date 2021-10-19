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
    trustedUsers = [ "@wheel" ];
    allowedUsers = [ "@wheel" ];
    sshServe = {
      enable = false;
      keys = [ ];
    };
    readOnlyStore = true;
    autoOptimiseStore = true;
    optimise = {
      automatic = true;
      dates = [ "12:00" ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
  };

  networking = {
    useDHCP = false;
    firewall = { enable = false; };
    networkmanager = {
      enable = true;
      wifi = { powersave = true; };
      connectionConfig = {

      };
    };
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
  };

  environment.systemPackages = with pkgs; [ git ];
  environment.defaultPackages = [ ];

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };
}
