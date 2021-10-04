{ pkgs, config, inputs, ... }:

let xdg = config.xdg;
in {
  home.packages = with pkgs; [
    stylua
    nixfmt
    python39Packages.black
    rustfmt
    nodePackages.purty
    # nodePackages.rustywind
    nodePackages.prettier
    # nodePackages.prettier_d_slim
    rufo
    elmPackages.elm-format
    haskellPackages.hindent
    (buildGoModule rec {
      pname = "dockfmt";
      version = "0.3.4";
      src = fetchFromGitHub {
        owner = "jessfraz";
        repo = "dockfmt";
        rev = "1455059b8bb53ab4723ef41946c43160583a8333";
        sha256 = "1y3abi1bxn0lfcwjd761lfkjw5algyy2vvmy66z7n4sw8f8bsh60";
      };
      vendorSha256 = null;
    })
  ];

  # Prettier plugin
  home.file = let
    pug = pkgs.callPackage ../../derivations/prettier-plugin-pug.nix {
      npmlock2nix = pkgs.callPackage inputs.npmlock2nix { };
    };
  in { "${xdg.dataHome}/prettier/@prettier/plugin-pug" = { source = pug; }; };
}
