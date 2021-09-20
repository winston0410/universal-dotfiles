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

  outputs = inputs: rec {
    modules = import ./modules/default.nix;

    collections = (import ./collections.nix) modules;

    profiles = (import ./profiles.nix) { inherit modules collections inputs; };
  };
}
