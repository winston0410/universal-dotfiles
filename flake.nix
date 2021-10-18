{
  description = "My universal flake repo";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
    dotfiles-manager = {
      url = "path:/home/hugosum/dotfiles-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    eww = {
      url = "github:elkowar/eww/master";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
    
    deploy-rs = {
      url = "github:serokell/deploy-rs/master";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };

    mkNodePackage = {
      url = "path:/home/hugosum/mkNodePackage";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };

    xdg = {
      url = "path:/home/hugosum/xdg.nix";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = inputs:
    (inputs.nixpkgs.lib.attrsets.recursiveUpdate
      (let modules = import ./modules/default.nix;
      in {
        inherit modules;

        profiles = (import ./profiles.nix) { inherit modules inputs; };

      }) (inputs.flake-utils.lib.eachDefaultSystem (system: {
        devShell = (({ pkgs, ... }:
          pkgs.mkShell {
            buildInputs = [ ];

            shellHook = ''
              nix flake lock --update-input home-manager;
              nix flake lock --update-input dotfiles-manager;
              nix flake lock --update-input xdg;
              nix flake lock --update-input mkNodePackage;
            '';
          }) { pkgs = inputs.nixpkgs.legacyPackages.${system}; });
      })));
}
