{ pkgs, config, inputs, system, ... }:

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
  home.file = let prettierPluginDir = "${xdg.dataHome}/prettier/node_modules";
  in {
    "${prettierPluginDir}/@prettier/plugin-xml" =
      let 
        version = "0a23520212735d19316dcec81161589c9d5bf897";
      in {
        source = (inputs.mkNodePackage.lib.${system}.mkNodePackage {
          pname = "prettier-plugin-xml";
          inherit version;
          src = pkgs.fetchFromGitHub {
            owner = "prettier";
            repo = "plugin-xml";
            rev = version;
            sha256 = "sha256-WUmEX4Vo4wvLEz0yxp1MioyGfixCqFApZuGZ1WwRsVo";
          };
          buildPhase = ''
            yarn prepublishOnly
          '';

          installPhase = ''
            mkdir -p "$out"
            cp -r dist "$out"
          '';
        });
      };
    "${prettierPluginDir}/@prettier/plugin-pug" =
      let version = "743f5aafa11d161537bbcd614fe5af81944a8d2f";
      in {
        source = (inputs.mkNodePackage.lib.${system}.mkNodePackage {
          pname = "prettier-plugin-pug";
          inherit version;
          src = pkgs.fetchFromGitHub {
            owner = "winston0410";
            repo = "plugin-pug";
            rev = version;
            sha256 = "sha256-SUH94XnD0a0JX3SQQmHB9SWnS7oVP9BiBcS9a7o4wm0=";
          };
          buildPhase = ''
            npm run build
          '';

          installPhase = ''
            mkdir -p "$out"
            cp -r dist "$out"
          '';
        });
      };
  };
}
