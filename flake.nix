{
  description = "My universal flake repo";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
    dotfiles-manager = {
      url = "github:winston0410/dotfiles-manager/master";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    eww = {
      url = "github:elkowar/eww/master";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = { self, nixpkgs, home-manager, dotfiles-manager, eww, ... }: rec {
    overlay = final: prev: { "${eww.packages.eww.pname}" = eww.packages.eww; };

    nixosModule = { pkgs, ... }: { nixpkgs.overlays = [ self.overlay ]; };

    modules = import ./modules/default.nix;

    collections = (import ./collections.nix) modules;

    profiles = (import ./profiles.nix) dotfiles-manager modules collections;
  };
}
